local conf = {}
local Remap = require("nils.keymap")
local Configger = require("utils.configger")

local nnoremap = Remap.nnoremap
local tnoremap = Remap.tnoremap

function conf.telescope()
  local previewers = require("telescope.previewers")
  local actions = require("telescope.actions")

  nnoremap("<C-f>", function()
    require("telescope.builtin").live_grep()
  end)

  nnoremap("<leader>fg", function()
    require("telescope.builtin").git_files()
  end)

  nnoremap("<Leader>ff", function()
    require("telescope.builtin").find_files()
  end)

  nnoremap("<Leader>fa", function()
    require("telescope.builtin").find_files({
      follow = true,
      no_ignore = true,
      hidden = true,
    })
  end)

  nnoremap("<C-p>", function()
    require("telescope.builtin").find_files()
  end)

  nnoremap("<leader>fb", function()
    require("telescope.builtin").buffers()
  end)

  nnoremap("<leader>fh", function()
    require("telescope.builtin").help_tags()
  end)

  nnoremap("<leader>gb", function()
    require("telescope.builtin").git_branches()
  end)

  nnoremap("<leader>gc", function()
    require("telescope.builtin").git_commits()
  end)

  nnoremap("<M-p>", "<cmd>Telescope menu<cr>")
  tnoremap("<M-p>", "<cmd>Telescope menu<cr>")

  local configger = Configger:new()
  local autocmd = vim.api.nvim_create_autocmd

  function SetColorscheme()
    configger:set("colorscheme", vim.g.colors_name)
  end

  autocmd("ColorScheme", {
    callback = SetColorscheme,
  })

  function TransparentToggle()
    vim.cmd("TransparentToggle")
    configger:set("transparency", vim.g.transparent_enabled)
  end

  require("telescope").setup({
    defaults = {
      file_sorter = require("telescope.sorters").get_fzy_sorter,
      prompt_prefix = " >",
      color_devicons = true,
      file_previewer = previewers.vim_buffer_cat.new,
      grep_previewer = previewers.vim_buffer_vimgrep.new,
      qflist_previewer = previewers.vim_buffer_qflist.new,
      mappings = {
        i = {
          ["<C-x>"] = false,
          ["<C-q>"] = actions.send_to_qflist,
        },
      },
    },
    extensions = {
      menu = {
        default = {
          items = {
            { "Flutter Packages",        "lua require('telescope').extensions.pubdev.list()" },
            { "Flutter",                 "lua require('telescope').extensions.flutter.commands()" },
            { "Checkhealth",             "checkhealth" },
            { "Files",                   "Telescope find_files" },
            { "Run Tests",               "lua require('neotest').run.run(vim.fn.expand('%'))" },
            { "Zen Mode Enable/Disable", "ZenMode" },
            { "Change Colorscheme",      "Telescope colorscheme" },
            { "Markdown Preview",        "MarkdownPreviewToggle" },
            { "Toggle Terminal",         "ToggleTerm" },
            { "npm start",               "tabnew npm start | term npm start" },
            { "Prettier",                "Prettier" },
            { "Toggle Indent Lines",     "IndentBlanklineToggle" },
            { "Diffview Open",           "DiffviewOpen" },
            { "Diffview Close",          "DiffviewClose" },
            {
              "Toggle Transparency",
              function()
                TransparentToggle()
              end,
            },
            { "Toggle Filetree",              "NvimTreeToggle" },
            { "Toggle Treesitter Context",    "TSContextToggle" },
            { "LSP Restart",                  "LspRestart" },
            { "Remove all // comments",       "%s/\\/\\/.*//g" },
            { "Remove all # comments",        "%s/#.*//g" },
            { "Mason",                        "Mason" },
            { "Lazy",                         "Lazy" },
            { "Package Manager",              "Lazy" },
            { "Show Undo Tree",               "UndotreeToggle" },
            { "Copilot disable",              "Copilot disable" },
            { "Copilot enable",               "Copilot enable" },
            { "Copilot restart",              "Copilot restart" },
            { "Toggle Spell check",           "set spell!" },
            { "Open Blame Commit in Browser", "GitBlameOpenCommitURL" },
            { "Toggle Git Blame",             "GitBlameToggle" },
            { "Toggle Outline",               "Lspsaga outline" },
            { "Refresh Colorizer",            "ColorizerReloadAllBuffers" },
            { "Toggle Colorizer",             "ColorizerToggle" },
            { "Show TODO",                    "TodoTelescope" },
          },
        },
      },
    },
    pickers = {
      colorscheme = {
        enable_preview = true,
      },
    },
  })

  require("telescope").load_extension("menu")
end

return conf
