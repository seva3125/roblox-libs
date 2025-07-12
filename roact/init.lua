--~strict
--[[
	Packages up the internals of Roact and exposes a public API for it.
]]
local dir = "https://raw.githubusercontent.com/seva3125/roblox-libs/refs/heads/main/roact"
local function import(dir,path)
	return loadstring(game:HttpGet(dir .. "/" .. path))()
end
local GlobalConfig = import(dir, "GlobalConfig.lua")
local createReconciler = import(dir, "createReconciler.lua")
local createReconcilerCompat = import(dir, "createReconcilerCompat.lua")
local RobloxRenderer = import(dir, "RobloxRenderer.lua")
local strict = import(dir, "strict.lua")
local Binding = import(dir, "Binding.lua")

local robloxReconciler = createReconciler(RobloxRenderer)
local reconcilerCompat = createReconcilerCompat(robloxReconciler)

local Roact = strict({
	Component = import(dir, "Component.lua"),
	createElement = import(dir, "createElement.lua"),
	createFragment = import(dir, "createFragment.lua"),
	oneChild = import(dir, "oneChild.lua"),
	PureComponent = import(dir, "PureComponent.lua"),
	None = import(dir, "None.lua"),
	Portal = import(dir, "Portal.lua"),
	createRef = import(dir, "createRef.lua"),
	forwardRef = import(dir, "forwardRef.lua"),
	createBinding = Binding.create,
	joinBindings = Binding.join,
	createContext = import(dir, "createContext.lua"),

	Change = import(dir, "PropMarkers/Change.lua"),
	Children = import(dir, "PropMarkers/Children.lua"),
	Event = import(dir, "PropMarkers/Event.lua"),
	Ref = import(dir, "PropMarkers/Ref.lua"),

	mount = robloxReconciler.mountVirtualTree,
	unmount = robloxReconciler.unmountVirtualTree,
	update = robloxReconciler.updateVirtualTree,

	reify = reconcilerCompat.reify,
	teardown = reconcilerCompat.teardown,
	reconcile = reconcilerCompat.reconcile,

	setGlobalConfig = GlobalConfig.set,

	-- APIs that may change in the future without warning
	UNSTABLE = {},
})

return Roact

