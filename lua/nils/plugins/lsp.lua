local conf = require("nils.configuration.lsp")

local lsp_filetype = {
  "typescript",
  "typescriptreact",
  "javascriptreact",
  "javascript",
  "dart",
  "html",
  "css",
  "c",
  "sh",
  "lua",
  "markdown",
  "dockerfile",
  "yaml",
}

return {
  {
    "VonHeikemen/lsp-zero.nvim",
    config = conf.lspzero,
    ft = lsp_filetype,
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

      -- Visual stuff
      {
        "jose-elias-alvarez/null-ls.nvim",
        config = conf.nullls,
      },
      {
        "folke/trouble.nvim",
        config = conf.trouble,
      },
    },
  },
}
