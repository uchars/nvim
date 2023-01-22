local Remap = require("nils.keymap")
local nnoremap = Remap.nnoremap

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

nnoremap("<leader>gw", function()
  require("telescope").extensions.git_worktree.git_worktrees()
end)

nnoremap("<leader>gm", function()
  require("telescope").extensions.git_worktree.create_git_worktree()
end)
