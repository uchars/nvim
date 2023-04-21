local download_lazy = function()
  if vim.fn.input("Download Lazy? (y for yes)") ~= "y" then
    return
  end

  local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
  vim.opt.rtp:prepend(lazypath)

  vim.cmd([[qa]])
end

return function()
  -- using packer as a basis of a new system.
  if not pcall(require, "lazy") then
    download_lazy()
    return true
  end
  return false
end
