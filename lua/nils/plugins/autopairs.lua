return {
  "windwp/nvim-autopairs",
  event = "BufEnter",
  config = function()
    require("nvim-autopairs").setup({
      disable_filetype = { "TelescopePrompt", "vim" },
    })
  end,
}
