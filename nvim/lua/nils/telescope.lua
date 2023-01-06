local ok, telescope = pcall(require, "telescope")
if not ok then
  print("telescope not installed")
  return
end

local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local previewers = require("telescope.previewers")
local action_state = require("telescope.actions.state")
local conf = require("telescope.config").values
local actions = require("telescope.actions")

telescope.setup({
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
  pickers = {
    find_files = {
      -- theme = "ivy"
    },
  },
})

telescope.load_extension("git_worktree")
-- require("telescope").load_extension("fzy_native")

local M = {}

local function refactor(prompt_bufnr)
  local content = action_state.get_selected_entry(prompt_bufnr)
  actions.close(prompt_bufnr)
  require("refactoring").refactor(content.value)
end

M.refactors = function()
  pickers
    .new({}, {
      prompt_title = "refactors",
      finder = finders.new_table({
        results = require("refactoring").get_refactors(),
      }),
      sorter = conf.generic_sorter({}),
      attach_mappings = function(_, map)
        map("i", "<CR>", refactor)
        map("n", "<CR>", refactor)
        return true
      end,
    })
    :find()
end

M.git_branches = function()
  require("telescope.builtin").git_branches({
    attach_mappings = function(_, map)
      map("i", "<c-d>", actions.git_delete_branch)
      map("n", "<c-d>", actions.git_delete_branch)
      return true
    end,
  })
end

return M
