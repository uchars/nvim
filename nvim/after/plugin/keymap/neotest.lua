local ok, neotest = pcall(require, "neotest")
if not ok then
  print("neotest not installed")
  return
end

local Remap = require("nils.keymap")
local nnoremap = Remap.nnoremap

vim.api.nvim_create_user_command("NeotestSummary", function()
    require("neotest").summary.open()
end, {})

vim.api.nvim_create_user_command("NeotestRun", function()
    require("neotest").run.run(vim.fn.expand("%"))
end, {})
