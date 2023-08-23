local conf = require("nils.configuration.treesitter")

return {
  {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    after = "telescope.nvim",
    config = conf.treesitter,
    dependencies = {
      "HiPhish/nvim-ts-rainbow2",
      {
        "nvim-treesitter/nvim-treesitter-context",
        config = conf.treesittercontext,
      },
    },
  },
  {
    "windwp/nvim-ts-autotag",
    ft = { "html", "xml", "javascript", "javascriptreact", "typescript", "typescriptreact", "svelte", "vue" },
    config = conf.autotag,
  },
  -- {
  --   "nvim-treesitter/playground",
  --   event = "BufEnter",
  -- },
}
