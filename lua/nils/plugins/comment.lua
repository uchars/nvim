return {
  {
    "numToStr/Comment.nvim",
    event = "BufReadPost",
    config = function()
      require("Comment").setup()
    end,
  },
  {
    "kkoomen/vim-doge",
    event = "BufReadPost",
    build = function()
      vim.fn["doge#install"]()
    end,
  },
}
