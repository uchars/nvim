return {
  "windwp/nvim-autopairs",
  event = "InsertEnter",
  config = function()
    require("nvim-autopairs").setup({
      disable_filetype = {
        "TelescopeResults",
        "TelescopePrompt",
        "vim",
        "NvimTree",
        "undotree",
        "terminal",
        "console",
        "term://*",
        "Term://*",
        "toggleterm",
      },
    })
  end,
}
