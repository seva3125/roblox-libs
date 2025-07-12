local dir = "https://raw.githubusercontent.com/seva3125/roblox-libs/refs/heads/main/roact"
local function import(dir,path)
	return loadstring(game:HttpGet(dir .. "/" .. path))()
end
local Symbol = import(dir, "Symbol.lua")

-- Marker used to specify that the value is nothing, because nil cannot be
-- stored in tables.
local None = Symbol.named("None")

return None
