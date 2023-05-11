local conf = require("nils.configuration.neotest")

return {
  "nvim-neotest/neotest",
  tag = "v2.6.4",
  ft = {
    "javascript*",
    "typescript*",
    "dart",
    "flutter",
    "python",
    "rust",
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "antoinemadec/FixCursorHold.nvim",
    "sonsan/neotest-jest",
    "marilari88/neotest-vitest",
    "nvim-neotest/neotest-plenary",
    "rouge8/neotest-rust",
  },
  config = conf.neotest,
}
