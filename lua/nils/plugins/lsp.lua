local conf = require("nils.configuration.lsp")

return {
  {
    "VonHeikemen/lsp-zero.nvim",
    config = conf.lspzero,
    event = "LspAttach",
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

      -- Snippets
      { "L3MON4D3/LuaSnip" }, -- Required
      { "rafamadriz/friendly-snippets" },

      {
        "j-hui/fidget.nvim",
        tag = "legacy",
        config = function()
          require("fidget").setup({
            text = {
              spinner = "moon",
            },
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
    },
  },
  {
    "Saecki/crates.nvim",
    event = { "BufReadPost Cargo.toml" },
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
    "jose-elias-alvarez/null-ls.nvim",
    config = conf.nullls,
    dependencies = {
      "jayp0521/mason-null-ls.nvim",
    },
    event = "BufReadPost",
  },
}
