local conf = {}
local nnoremap = require("nils.keymap").nnoremap

function conf.neotest()
  nnoremap("<leader>t", "<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<cr>")
  require("neotest").setup({
    adapters = {
      require("neotest-plenary"),
      require("neotest-dart")({
        command = "flutter",
        use_lsp = false,
      }),
      require("neotest-jest")({
        jestCommand = "npm test",
      }),
      require("neotest-python"),
    },
  })
end

return conf
