local conf = {}
local Remap = require("nils.keymap")

local nnoremap = Remap.nnoremap
local tnoremap = Remap.tnoremap

function conf.telescope()
  local previewers = require("telescope.previewers")
  local actions = require("telescope.actions")

  nnoremap("<M-p>", "<cmd>Telescope menu<cr>")
  tnoremap("<M-p>", "<cmd>Telescope menu<cr>")

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
            { "Checkhealth", "checkhealth" },
            { "Neogit", "Neogit" },
            { "Files", "Telescope find_files" },
            { "Run Tests", "lua require('neotest').run.run(vim.fn.expand('%'))" },
            { "Zen Mode Enable/Disable", "ZenMode" },
            { "Change Colorscheme", "Telescope colorscheme" },
            { "Markdown Preview", "MarkdownPreviewToggle" },
            { "Toggle Floating Terminal", "lua require('FTerm').toggle()" },
            { "Open Floating Terminal", "lua require('FTerm').open()" },
            { "Close Floating Terminal", "lua require('FTerm').close()" },
            { "npm install", "lua require('FTerm').scratch({cmd = 'npm i'})" },
            { "npm start", "lua require('FTerm').scratch({cmd = 'npm start'})" },
            { "Prettier", "Prettier" },
            { "Toggle Indent Lines", "IndentBlanklineToggle" },
            { "Diffview Open", "DiffviewOpen" },
            { "Diffview Close", "DiffviewClose" },
            { "Flutter Run", "lua require('FTerm').scratch({cmd = 'flutter run'})" },
            { "Flutter Pub Get", "lua require('FTerm').scratch({cmd = 'flutter pub get'})" },
          },
        },
      },
      file_browser = {
        hijack_netrw = true,
      },
    },
    pickers = {
      find_files = {
        -- theme = "ivy"
      },
    },
  })

  require("telescope").load_extension("git_worktree")
  require("telescope").load_extension("menu")
end

return conf
