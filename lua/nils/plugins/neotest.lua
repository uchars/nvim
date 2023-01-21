local conf = require("nils.configuration.neotest")

return {
  {
    "nvim-neotest/neotest",
    lazy = false,
    tag = "v2.6.4",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      {
        "haydenmeade/neotest-jest",
        commit = "a5b924a05737beb461aab2bef39b5dc44bc3fe9a",
      },
      "nvim-neotest/neotest-plenary",
      "nvim-neotest/neotest-python",
      "sidlatau/neotest-dart",
    },
    config = conf.neotest,
  },
}
