local ok, neotest = pcall(require, "neotest")
if not ok then
  return
end

neotest.setup({
  adapters = {
    require("neotest-dart")({
      command = "flutter",
      use_lsp = true,
    }),
    require("neotest-jest")({
      jestCommand = "npm test --",
      env = { CI = true },
      cwd = function(path)
        return vim.fn.getcwd()
      end,
    }),
    require("neotest-python"),
  },
})
