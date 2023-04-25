local conf = require("nils.configuration.treesitter")

return {
  {
    "nvim-treesitter/nvim-treesitter",
    event = "BufEnter",
    after = "telescope.nvim",
    config = conf.treesitter,
  },
  {
    "romgrk/nvim-treesitter-context",
    event = "BufRead",
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
