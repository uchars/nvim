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
      },
      {
        "williamboman/mason-lspconfig.nvim",
      },
      {
        "jayp0521/mason-null-ls.nvim",
        opts = {
          automatic_installation = true,
          automatic_setup = true,
          ensure_installed = {
            "autopep8",
            "eslint_d",
            "fixjson",
            "stylua",
            "markdownlint",
            "prettierd",
          },
        },
      },

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
        dependencies = {
          "jayp0521/mason-null-ls.nvim",
        },
        event = "LspAttach",
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
    dependencies = "nvim-lua/plenary.nvim",
    config = function()
      require("crates").setup({
        null_ls = {
          enabled = true,
          name = "crates.nvim",
        },
      })
    end,
  },
  {
    "j-hui/fidget.nvim",
    event = "LspAttach",
    config = function()
      require("fidget").setup({
        window = {
          blend = 0,
        },
        sources = {
          ["null-ls"] = {
            ignore = true,
          },
        },
      })
    end,
  },
}
