require("nils.set")

-- TODO: save map with file & bool.
local file_open = false

function OpenInBrowser(file)
  if file_open then
    return
  end

  local open_cmd
  -- Determine the appropriate command based on the operating system
  if vim.fn.has("mac") == 1 then
    open_cmd = "open"
  elseif vim.fn.has("unix") == 1 then
    open_cmd = "xdg-open"
  elseif vim.fn.has("win32") == 1 then
    open_cmd = "start"
  else
    print("Unsupported operating system")
    return
  end
  local command = string.format("%s %s", open_cmd, file)
  file_open = true
  vim.fn.system(command)
end

local augroup = vim.api.nvim_create_augroup
NilsGroup = augroup("Nils", {})

local autocmd = vim.api.nvim_create_autocmd
local yank_group = augroup("HighlightYank", {})

function R(name)
  require("plenary.reload").reload_module(name)
end

vim.cmd([[autocmd FileType * setlocal formatoptions-=cro]])

autocmd("TextYankPost", {
  group = yank_group,
  pattern = "*",
  callback = function()
    vim.highlight.on_yank({
      higroup = "IncSearch",
      timeout = 40,
    })
  end,
})

autocmd({ "BufWritePre" }, {
  group = NilsGroup,
  pattern = "*",
  command = "%s/\\s\\+$//e",
})

autocmd("BufWritePost", {
  group = NilsGroup,
  pattern = "swagger.json",
  callback = function()
    local current_buffer = vim.api.nvim_get_current_buf()
    local file_path = vim.api.nvim_buf_get_name(current_buffer)
    local folder_path = vim.fn.fnamemodify(file_path, ":h")
    --redoc-cli bundle -o docs/restv1/index.html docs/restv1/swagger.json
    local cmd = "redoc-cli bundle -o " .. folder_path .. "/index.html " .. file_path
    vim.fn.jobstart(cmd)
    OpenInBrowser(folder_path .. "/index.html")
  end,
})

vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25

vim.g.setlocal_spelllang = "en_us"
