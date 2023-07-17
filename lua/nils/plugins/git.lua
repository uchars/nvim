local conf = require("nils.configuration.git")

return {
  "tpope/vim-fugitive",
  event = "VeryLazy",
  config = conf.git,
  dependencies = {
    "lewis6991/gitsigns.nvim",
    "nvim-lua/plenary.nvim",
    "f-person/git-blame.nvim",
  },
}
