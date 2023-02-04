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
        commit = "369d520350b4c1af40630f90c3703444c40c065a",
      }, -- Optional
      {
        "williamboman/mason-lspconfig.nvim",
        commit = "4674ed145fd0e72c9bfdb32b647f968b221bf2f2",
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
        "glepnir/lspsaga.nvim",
        config = conf.lspsaga,
        event = "BufEnter",
        commit = "f4d12606719b1256445922b864fe09974e2f8cee",
      },
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
