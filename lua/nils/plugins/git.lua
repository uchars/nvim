local conf = require("nils.configuration.git")

return {
  "ThePrimeagen/git-worktree.nvim",
  cond = vim.fn.finddir(".git", vim.fn.getcwd() .. ";") ~= "",
  event = "BufEnter",
  config = conf.git,
  dependencies = {
    "lewis6991/gitsigns.nvim",
    "sindrets/diffview.nvim",
    "nvim-lua/plenary.nvim",
  },
}
