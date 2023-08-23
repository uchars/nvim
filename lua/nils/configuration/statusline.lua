local icons = require("nils.icons")
local conf = {}

local mode_map = {
  ["n"] = "N",
  ["no"] = "O·P",
  ["nov"] = "O·P",
  ["noV"] = "O·P",
  ["no\22"] = "O·P",
  ["niI"] = "N·I",
  ["niR"] = "N·R",
  ["niV"] = "N",
  ["nt"] = "N·T",
  ["v"] = "V",
  ["vs"] = "V",
  ["V"] = "V·L",
  ["Vs"] = "V·L",
  ["\22"] = "V·B",
  ["\22s"] = "V·B",
  ["s"] = "S",
  ["S"] = "S·L",
  ["\19"] = "S·B",
  ["i"] = "I",
  ["ic"] = "I·C",
  ["ix"] = "I·X",
  ["R"] = "R",
  ["Rc"] = "R·C",
  ["Rx"] = "R·X",
  ["Rv"] = "V·R",
  ["Rvc"] = "RVC",
  ["Rvx"] = "RVX",
  ["c"] = "C",
  ["cv"] = "EX",
  ["ce"] = "EX",
  ["r"] = "R",
  ["rm"] = "M",
  ["r?"] = "C",
  ["!"] = "SH",
  ["t"] = "T",
}

local function modes()
  return mode_map[vim.api.nvim_get_mode().mode] or "__"
end

local function git()
  if not vim.b.gitsigns_head or vim.b.gitsigns_git_status then
    return ""
  end

  local git_status = vim.b.gitsigns_status_dict

  local added = (git_status.added and git_status.added ~= 0) and (icons.gitAdd .. git_status.added) or ""
  local changed = (git_status.changed and git_status.changed ~= 0) and (icons.gitChange .. git_status.changed) or ""
  local removed = (git_status.removed and git_status.removed ~= 0) and (icons.gitRemove .. git_status.removed) or ""
  local branch_name = icons.gitBranch .. git_status.head

  return branch_name .. added .. changed .. removed
end

function conf.lualine()
  local git_blame = require("gitblame")
  require("lualine").setup({
    options = {
      section_separators = { left = "", right = "" },
      component_separators = { left = "", right = "" },
      disabled_filetypes = { "dashboard" },
    },
    sections = {
      lualine_a = { modes },
      lualine_b = { "filename" },
      lualine_c = {
        git,
        {
          git_blame.get_current_blame_text,
          cond = git_blame.is_blame_text_available,
        },
      },
      lualine_x = { "diagnostics", "filetype" },
      lualine_y = { "progress" },
      lualine_z = { "location" },
    },
  })
end

return conf
