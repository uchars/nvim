local s1, autotag = pcall(require, "nvim-ts-autotag")
if not s1 then
  print("autotag not installed")
  return
end

autotag.setup()
