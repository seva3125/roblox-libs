local dir = "https://raw.githubusercontent.com/seva3125/roblox-libs/refs/heads/main/roact"
local function import(dir, path)
	return loadstring(game:HttpGet(dir .. "/" .. path))()
end

local ElementKind = import(dir, "ElementKind.lua")
local Type = import(dir, "Type.lua")


local function createFragment(elements)
	return {
		[Type] = Type.Element,
		[ElementKind] = ElementKind.Fragment,
		elements = elements,
	}
end

return createFragment
