return {
  {
    "numToStr/Comment.nvim",
    event = "BufEnter",
    config = function()
      require("Comment").setup()
    end,
  },
  {
    "kkoomen/vim-doge",
    event = "BufEnter",
    build = function()
      vim.fn["doge#install"]()
    end,
  },
}
