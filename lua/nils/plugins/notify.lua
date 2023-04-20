return {
  "rcarriga/nvim-notify",
  event = "VeryLazy",
  config = function()
    require("notify").setup({
      timeout = 3000,
      render = "compact",
      max_height = 5,
      stages = "static",
    })
    vim.notify = require("notify")
  end,
}
