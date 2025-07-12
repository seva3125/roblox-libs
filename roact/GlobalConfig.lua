--[[
	Exposes a single instance of a configuration as Roact's GlobalConfig.
]]
local dir = "https://raw.githubusercontent.com/seva3125/roblox-libs/refs/heads/main/roact"
local function import(dir,path)
	return loadstring(game:HttpGet(dir .. "/" .. path))()
end
local Config = import(dir, "Config.lua")

return Config.new()
