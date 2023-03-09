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
    after = "nvim-treesitter",
    config = conf.treesittercontext,
  },
  {
    "windwp/nvim-ts-autotag",
    after = "nvim-treesitter",
    config = conf.autotag,
  },
}
