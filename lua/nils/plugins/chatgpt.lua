return {
  "jackMort/ChatGPT.nvim",
  commit = "8820b99c",
  event = "BufEnter",
  config = function()
    require("chatgpt").setup({})
  end,
  dependencies = {
    "MunifTanjim/nui.nvim",
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
  },
}
