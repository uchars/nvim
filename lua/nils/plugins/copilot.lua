return {
  "github/copilot.vim",
  event = "BufEnter",
  config = function()
    vim.g.copilot_no_tab_map = true
    vim.api.nvim_set_keymap("i", "<M-p>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
  end,
}
