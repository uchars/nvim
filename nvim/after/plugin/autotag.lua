local s1, autotag = pcall(require, "autotag")
if not s1 then
    print("autotag not installed")
    return
end

autotag.setup()

