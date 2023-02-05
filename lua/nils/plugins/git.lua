local conf = require("nils.configuration.git")

return {
  "ThePrimeagen/git-worktree.nvim",
  {
    "lewis6991/gitsigns.nvim",
    event = "BufEnter",
    config = conf.gitsigns,
  },
  {
    "mbbill/undotree",
    event = "BufEnter",
  },
  {
    "TimUntersberger/neogit",
    event = "UIEnter",
    config = conf.neogit,
  },
  {
    "sindrets/diffview.nvim",
    event = "BufEnter",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },
}
