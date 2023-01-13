local conf = require("nils.configuration.git")

return {
  "ThePrimeagen/git-worktree.nvim",
  {
    "lewis6991/gitsigns.nvim",
    config = conf.gitsigns,
  },
  "mbbill/undotree",
  "TimUntersberger/neogit",
  "sindrets/diffview.nvim",
}
