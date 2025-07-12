local dir = "https://raw.githubusercontent.com/seva3125/roblox-libs/refs/heads/main/roact"
local function import(dir, path)
	return loadstring(game:HttpGet(dir .. "/" .. path))()
end

local Symbol = import(dir, "Symbol.lua")
local strict = import(dir, "strict.lua")


local ComponentLifecyclePhase = strict({
	-- Component methods
	Init = Symbol.named("init"),
	Render = Symbol.named("render"),
	ShouldUpdate = Symbol.named("shouldUpdate"),
	WillUpdate = Symbol.named("willUpdate"),
	DidMount = Symbol.named("didMount"),
	DidUpdate = Symbol.named("didUpdate"),
	WillUnmount = Symbol.named("willUnmount"),

	-- Phases describing reconciliation status
	ReconcileChildren = Symbol.named("reconcileChildren"),
	Idle = Symbol.named("idle"),
}, "ComponentLifecyclePhase")

return ComponentLifecyclePhase
