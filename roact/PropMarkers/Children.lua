local dir = "https://raw.githubusercontent.com/seva3125/roblox-libs/refs/heads/main/roact"
local function import(dir, path)
	return loadstring(game:HttpGet(dir .. "/" .. path))()
end

local Symbol = import(dir, "Symbol.lua")


local Children = Symbol.named("Children")

return Children
