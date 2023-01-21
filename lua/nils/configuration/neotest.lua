local conf = {}

function conf.neotest()
  require("neotest").setup({
    adapters = {
      require("neotest-dart")({
        command = "flutter",
        use_lsp = true,
      }),
      require("neotest-jest"),
      -- require("neotest-vitest"),
      require("neotest-python"),
    },
  })
end

return conf
