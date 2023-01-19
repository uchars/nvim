local conf = {}

function conf.neogit()
  local nnoremap = require("nils.keymap").nnoremap
  local _, neogit = pcall(require, "neogit")

  neogit.setup({})

  nnoremap("<leader>gs", function()
    neogit.open({})
  end)

  nnoremap("<leader>ga", "<cmd>!git fetch --all<CR>")
end

function conf.gitsigns()
  -- local ok, diffview = pcall(require, "diffview")
  -- if not ok then
  --   print("diffview not installed")
  --   return
  -- end

  require("gitsigns").setup({
    signs = {
      add = { hl = "GitSignsAdd", text = "│", numhl = "GitSignsAddNr" },
      change = { hl = "GitSignsChange", text = "│", numhl = "GitSignsChangeNr" },
      delete = { hl = "GitSignsDelete", text = "_", numhl = "GitSignsDeleteNr" },
      topdelete = { hl = "GitSignsDelete", text = "‾", numhl = "GitSignsDeleteNr" },
      changedelete = { hl = "GitSignsDelete", text = "~", numhl = "GitSignsChangeNr" },
    },

    -- Highlights just the number part of the number column
    numhl = true,

    -- Highlights the _whole_ line.
    --    Instead, use gitsigns.toggle_linehl()
    linehl = false,

    -- Highlights just the part of the line that has changed
    --    Instead, use gitsigns.toggle_word_diff()
    word_diff = false,

    keymaps = {
      -- Default keymap options
      noremap = true,
      buffer = true,

      ["n <space>hd"] = { expr = true, "&diff ? ']c' : '<cmd>lua require\"gitsigns\".next_hunk()<CR>'" },
      ["n <space>hu"] = { expr = true, "&diff ? '[c' : '<cmd>lua require\"gitsigns\".prev_hunk()<CR>'" },

      -- ['n <leader>hs'] = '<cmd>lua require"gitsigns".stage_hunk()<CR>',
      -- ['n <leader>hu'] = '<cmd>lua require"gitsigns".undo_stage_hunk()<CR>',
      -- ['n <leader>hr'] = '<cmd>lua require"gitsigns".reset_hunk()<CR>',
      -- ['n <leader>hp'] = '<cmd>lua require"gitsigns".preview_hunk()<CR>',
      -- ['n <leader>hb'] = '<cmd>lua require"gitsigns".blame_line()<CR>',
    },

    current_line_blame_opts = {
      delay = 2000,
      virt_text_pos = "eol",
    },
  })
end

return conf
