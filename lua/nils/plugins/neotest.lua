local conf = require("nils.configuration.neotest")

return {
  {
    "nvim-neotest/neotest",
    ft = {
      "javascript",
      "javascriptreact",
      "typescript",
      "typescriptreact",
      "python",
      "dart",
    },
    dependencies = {
      "antoinemadec/FixCursorHold.nvim",
      "haydenmeade/neotest-jest",
      -- "marilari88/neotest-vitest",
      "nvim-neotest/neotest-python",
      "sidlatau/neotest-dart",
    },
    config = conf.neotest,
  },
}
