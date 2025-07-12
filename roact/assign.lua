local dir = "https://raw.githubusercontent.com/seva3125/roblox-libs/refs/heads/main/roact"
local function import(dir, path)
	return loadstring(game:HttpGet(dir .. "/" .. path))()
end

local None = import(dir, "None.lua")


--[[
	Merges values from zero or more tables onto a target table. If a value is
	set to None, it will instead be removed from the table.

	This function is identical in functionality to JavaScript's Object.assign.
]]
local function assign(target, ...)
	for index = 1, select("#", ...) do
		local source = select(index, ...)

		if source ~= nil then
			for key, value in pairs(source) do
				if value == None then
					target[key] = nil
				else
					target[key] = value
				end
			end
		end
	end

	return target
end

return assign
