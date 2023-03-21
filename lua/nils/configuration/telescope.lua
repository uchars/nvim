local Path = require("plenary.path")
local conf = {}
local Remap = require("nils.keymap")

local nnoremap = Remap.nnoremap
local tnoremap = Remap.tnoremap

function conf.telescope()
  local previewers = require("telescope.previewers")
  local actions = require("telescope.actions")

  nnoremap("<C-f>", function()
    require("telescope.builtin").live_grep()
  end)

  nnoremap("<leader>pg", function()
    require("telescope.builtin").git_files()
  end)

  nnoremap("<Leader>pf", function()
    require("telescope.builtin").find_files()
  end)

  nnoremap("<C-p>", function()
    require("telescope.builtin").find_files()
  end)

  nnoremap("<leader>pb", function()
    require("telescope.builtin").buffers()
  end)

  nnoremap("<leader>vh", function()
    require("telescope.builtin").help_tags()
  end)

  nnoremap("<leader>gb", function()
    require("telescope.builtin").git_branches()
  end)

  nnoremap("<M-p>", "<cmd>Telescope menu<cr>")
  tnoremap("<M-p>", "<cmd>Telescope menu<cr>")

  local function getConfig()
    local config_path = vim.fn.stdpath("data") .. "/config.json"
    local config_json = {}
    if Path:new(config_path):exists() then
      local config_content = Path:new(config_path):read()
      config_json = vim.fn.json_decode(config_content)
    end
    return config_json
  end

  local function writeConfig(config)
    Path:new(vim.fn.stdpath("data") .. "/config.json"):write(vim.fn.json_encode(config), "w")
  end

  local autocmd = vim.api.nvim_create_autocmd
  autocmd("ColorScheme", {
    callback = function()
      local config = getConfig()
      config.colorscheme = vim.g.colors_name
      writeConfig(config)
    end,
  })

  function TransparentToggle()
    vim.cmd("TransparentToggle")
    local config = getConfig()
    config.transparency = vim.g.transparent_enabled
    writeConfig(config)
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
            { "Flutter Packages",         "lua require('telescope').extensions.pubdev.list()" },
            { "Flutter",                  "lua require('telescope').extensions.flutter.commands()" },
            { "Checkhealth",              "checkhealth" },
            { "Files",                    "Telescope find_files" },
            { "Run Tests",                "lua require('neotest').run.run(vim.fn.expand('%'))" },
            { "Zen Mode Enable/Disable",  "ZenMode" },
            { "Change Colorscheme",       "Telescope colorscheme" },
            { "Markdown Preview",         "MarkdownPreviewToggle" },
            { "Toggle Floating Terminal", "lua require('FTerm').toggle()" },
            { "Open Floating Terminal",   "lua require('FTerm').open()" },
            { "Close Floating Terminal",  "lua require('FTerm').close()" },
            { "npm install",              "lua require('FTerm').scratch({cmd = 'npm i'})" },
            { "npm start",                "tabnew npm start | term npm start" },
            { "Prettier",                 "Prettier" },
            { "Toggle Indent Lines",      "IndentBlanklineToggle" },
            { "Diffview Open",            "DiffviewOpen" },
            { "Diffview Close",           "DiffviewClose" },
            {
              "Toggle Transparency",
              function()
                TransparentToggle()
              end,
            },
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
