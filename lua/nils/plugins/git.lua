local conf = require("nils.configuration.git")

return {
  "tpope/vim-fugitive",
  cond = vim.fn.finddir(".git", vim.fn.getcwd() .. ";") ~= "",
  event = "BufEnter",
  config = conf.git,
  dependencies = {
    "lewis6991/gitsigns.nvim",
    "nvim-lua/plenary.nvim",
    "f-person/git-blame.nvim",
  },
}
