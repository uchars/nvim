local conf = {}

local function git()
  if not vim.b.gitsigns_head or vim.b.gitsigns_git_status then
    return ""
  end

  local git_status = vim.b.gitsigns_status_dict

  local added = (git_status.added and git_status.added ~= 0) and ("  " .. git_status.added) or ""
  local changed = (git_status.changed and git_status.changed ~= 0) and ("  " .. git_status.changed) or ""
  local removed = (git_status.removed and git_status.removed ~= 0) and ("  " .. git_status.removed) or ""
  local branch_name = "  " .. git_status.head

  return branch_name .. added .. changed .. removed
end

function conf.lualine()
  local git_blame = require("gitblame")
  require("lualine").setup({
    options = {
      section_separators = { left = "", right = "" },
      component_separators = { left = "", right = "" },
    },
    sections = {
      lualine_a = { "mode" },
      lualine_b = { "filename" },
      lualine_c = {
        git,
        {
          git_blame.get_current_blame_text,
          cond = git_blame.is_blame_text_available,
        },
      },
      lualine_x = { "diagnostics", "lsp_progress", "filetype" },
      lualine_y = {},
      lualine_z = { "progress" },
    },
  })
end

return conf
