local conf = require("nils.configuration.treesitter")

return {
  {
    "nvim-treesitter/nvim-treesitter",
    event = "BufEnter",
    after = "telescope.nvim",
    config = conf.treesitter,
    dependencies = {
      "yioneko/nvim-yati",
    },
  },
  {
    "romgrk/nvim-treesitter-context",
    event = "BufEnter",
    after = "nvim-treesitter",
    config = conf.treesittercontext,
  },
  {
    "windwp/nvim-ts-autotag",
    after = "nvim-treesitter",
    ft = { "html", "javascript", "javascriptreact", "typescript", "typescriptreact", "svelte", "vue" },
    config = conf.autotag,
  },
}
