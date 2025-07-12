type Iterator__DARKLUA_TYPE_a<K,V> =({[K]:V},K?)->(K?,V?)

type Element__DARKLUA_TYPE_b={[any]:any}local a a={cache={}, load=function(b)if not a.cache[b]then a.cache[b]={c=a[b]()}end return a.cache[b].c end}do function a.a()
















local b={internalTypeChecks=

false,typeChecks=

false,elementTracing=

false,propValidation=

false,
}


local c={}
for d in pairs(b)do
table.insert(c,d)
end

local d={}

function d.new()
local e={}

e._currentConfig=setmetatable({},{
__index=function(f,g)
local h=("Invalid global configuration key %q. Valid configuration keys are: %s"):format(
tostring(g),
table.concat(c,", ")
)

error(h,3)
end,
})




e.set=function(...)
return d.set(e,...)
end

e.get=function(...)
return d.get(e,...)
end

e.scoped=function(...)
return d.scoped(e,...)
end

e.set(b)

return e
end

function d.set(e,f)


for g,h in pairs(f)do
if b[g]==nil then
local i=("Invalid global configuration key %q (type %s). Valid configuration keys are: %s"):format(
tostring(g),
typeof(g),
table.concat(c,", ")
)

error(i,3)
end


if typeof(h)~="boolean"then
local i=(
"Invalid value %q (type %s) for global configuration key %q. Valid values are: true, false"
):format(tostring(h),typeof(h),tostring(g))

error(i,3)
end

e._currentConfig[g]=h
end
end

function d.get(e)
return e._currentConfig
end

function d.scoped(e,f,g)
local h={}
for i,j in pairs(e._currentConfig)do
h[i]=j
end

e.set(f)

local i,j=pcall(g)

e.set(h)

assert(i,j)
end

return d end function a.b()





local b=a.load'a'

return b.new()end function a.c()









local b={}







function b.named(c)
assert(type(c)=="string","Symbols must be created using a string name!")

local d=newproxy(true)

local e=("Symbol(%s)"):format(c)

getmetatable(d).__tostring=function()
return e
end

return d
end

return b end function a.d()


local function strict(b:{[any]:any},c:string?)


local d=c or tostring(b)

return setmetatable(b,{
__index=function(e,f)
local g=("%q (%s) is not a valid member of %s"):format(tostring(f),typeof(f),d)

error(g,2)
end,

__newindex=function(e,f,g)
local h=("%q (%s) is not a valid member of %s"):format(tostring(f),typeof(f),d)

error(h,2)
end,
})
end

return strict end function a.e()












local b=a.load'c'
local c=a.load'd'

local d=newproxy(true)

local e={}

local function addType(f)
e[f]=b.named("Roact"..f)
end

addType"Binding"
addType"Element"
addType"HostChangeEvent"
addType"HostEvent"
addType"StatefulComponentClass"
addType"StatefulComponentInstance"
addType"VirtualNode"
addType"VirtualTree"

function e.of(f)
if typeof(f)~="table"then
return nil
end

return f[d]
end

getmetatable(d).__index=e

getmetatable(d).__tostring=function()
return"RoactType"
end

c(e,"Type")

return d end function a.f()

local b=a.load'c'

local c=b.named"Portal"

return c end function a.g()











local b=a.load'c'
local c=a.load'd'
local d=a.load'f'


local e=newproxy(true)

local f={
Portal=b.named"Portal",
Host=b.named"Host",
Function=b.named"Function",
Stateful=b.named"Stateful",
Fragment=b.named"Fragment",
}

function f.of(g)
if typeof(g)~="table"then
return nil
end

return g[e]
end

local g={string=
f.Host,
["function"]=f.Function,table=
f.Stateful,
}

function f.fromComponent(h)
if h==d then
return e.Portal
else
return g[typeof(h)]
end
end

getmetatable(e).__index=f

c(f,"ElementKind")

return e end function a.h()


local b=a.load'e'
local c=a.load'c'


local function noop()
return nil
end

local d={}








d.UseParentKey=c.named"UseParentKey"
























function d.iterateElements<K>(e):(Iterator__DARKLUA_TYPE_a<K,Element__DARKLUA_TYPE_b>,any,nil)
local f=b.of(e)


if f==b.Element then
local g=false

return function(h,i)
if g then
return nil
else
g=true
return d.UseParentKey,e
end
end
end

local g=typeof(e)

if e==nil or g=="boolean"then
return(noop::any)::Iterator__DARKLUA_TYPE_a<K,Element__DARKLUA_TYPE_b>
end

if g=="table"then
return pairs(e)
end

error"Invalid elements"
end










function d.getElementByKey(e,f)
if e==nil or typeof(e)=="boolean"then
return nil
end

if b.of(e)==b.Element then
if f==d.UseParentKey then
return e
end

return nil
end

if typeof(e)=="table"then
return e[f]
end

error"Invalid elements"
end

return d end function a.i()

local b=a.load'c'

local c=b.named"Children"

return c end function a.j()

local function internalAssert(b,c)
if not b then
error(c.." (This is probably a bug in Roact!)",3)
end
end

return internalAssert end function a.k()


local b=a.load'e'
local c=a.load'g'
local d=a.load'h'
local e=a.load'i'
local f=a.load'c'
local g=a.load'j'

local i=a.load'b'.get()


local j=f.named"InternalData"













local function createReconciler(k)
local l
local m
local n
local o







local function replaceVirtualNode(p,q)
local r=p.hostParent
local s=p.hostKey
local t=p.depth
local u=p.parent




local v=p.originalContext or p.context
local w=p.parentLegacyContext




if not p.wasUnmounted then
o(p)
end
local x=m(q,r,s,v,w)


if x~=nil then
x.depth=t
x.parent=u
end

return x
end





local function updateChildren(p,q,r)
if i.internalTypeChecks then
g(b.of(p)==b.VirtualNode,"Expected arg #1 to be of type VirtualNode")
end

p.updateChildrenCount=p.updateChildrenCount+1

local s=p.updateChildrenCount

local t={}


for u,v in pairs(p.children)do
local w=d.getElementByKey(r,u)
local x=n(v,w)




if p.updateChildrenCount~=s then
if x and x~=p.children[u]then
o(x)
end
return
end

if x~=nil then
p.children[u]=x
else
t[u]=true
end
end

for u in pairs(t)do
p.children[u]=nil
end


for u,v in d.iterateElements(r)do
local w=u
if u==d.UseParentKey then
w=p.hostKey
end

if p.children[u]==nil then
local x=m(
v,
q,
w,
p.context,
p.legacyContext
)




if p.updateChildrenCount~=s then
if x then
o(x)
end
return
end


if x~=nil then
x.depth=p.depth+1
x.parent=p
p.children[u]=x
end
end
end
end

local function updateVirtualNodeWithChildren(p,q,r)
updateChildren(p,q,r)
end

local function updateVirtualNodeWithRenderResult(p,q,r)
if b.of(r)==b.Element or r==nil or typeof(r)=="boolean"then
updateChildren(p,q,r)
else
error(
("%s\n%s"):format(
"Component returned invalid children:",
p.currentElement.source or"<enable element tracebacks>"
),
0
)
end
end




function o(p)
if i.internalTypeChecks then
g(b.of(p)==b.VirtualNode,"Expected arg #1 to be of type VirtualNode")
end

p.wasUnmounted=true

local q=c.of(p.currentElement)


if q==c.Host then
k.unmountHostNode(l,p)
elseif q==c.Function then
for r,s in pairs(p.children)do
o(s)
end
elseif q==c.Stateful then
p.instance:__unmount()
elseif q==c.Portal then
for r,s in pairs(p.children)do
o(s)
end
elseif q==c.Fragment then
for r,s in pairs(p.children)do
o(s)
end
else
error(("Unknown ElementKind %q"):format(tostring(q)),2)
end
end

local function updateFunctionVirtualNode(p,q)
local r=q.component(q.props)

updateVirtualNodeWithRenderResult(p,p.hostParent,r)

return p
end

local function updatePortalVirtualNode(p,q)
local r=p.currentElement
local s=r.props.target

local t=q.props.target

assert(k.isHostObject(t),"Expected target to be host object")

if t~=s then
return replaceVirtualNode(p,q)
end

local u=q.props[e]

updateVirtualNodeWithChildren(p,t,u)

return p
end

local function updateFragmentVirtualNode(p,q)
updateVirtualNodeWithChildren(p,p.hostParent,q.elements)

return p
end













function n(p,q,r:{[any]:any}?):{[any]:any}?
if i.internalTypeChecks then
g(b.of(p)==b.VirtualNode,"Expected arg #1 to be of type VirtualNode")
end
if i.typeChecks then
assert(
b.of(q)==b.Element or typeof(q)=="boolean"or q==nil,
"Expected arg #2 to be of type Element, boolean, or nil"
)
end


if p.currentElement==q and r==nil then
return p
end

if typeof(q)=="boolean"or q==nil then
o(p)
return nil
end

if p.currentElement.component~=q.component then
return replaceVirtualNode(p,q)
end

local s=c.of(q)

local t=true

if s==c.Host then
p=k.updateHostNode(l,p,q)
elseif s==c.Function then
p=updateFunctionVirtualNode(p,q)
elseif s==c.Stateful then
t=p.instance:__update(q,r)
elseif s==c.Portal then
p=updatePortalVirtualNode(p,q)
elseif s==c.Fragment then
p=updateFragmentVirtualNode(p,q)
else
error(("Unknown ElementKind %q"):format(tostring(s)),2)
end



if not t then
return p
end

p.currentElement=q

return p
end




local function createVirtualNode(p,q,r,s,t)
if i.internalTypeChecks then
g(
k.isHostObject(q)or q==nil,
"Expected arg #2 to be a host object"
)
g(typeof(s)=="table"or s==nil,"Expected arg #4 to be of type table or nil")
g(
typeof(t)=="table"or t==nil,
"Expected arg #5 to be of type table or nil"
)
end
if i.typeChecks then
assert(r~=nil,"Expected arg #3 to be non-nil")
assert(
b.of(p)==b.Element or typeof(p)=="boolean",
"Expected arg #1 to be of type Element or boolean"
)
end

return{
[b]=b.VirtualNode,
currentElement=p,
depth=1,
parent=nil,
children={},
hostParent=q,
hostKey=r,
updateChildrenCount=0,
wasUnmounted=false,



legacyContext=t,


parentLegacyContext=t,



context=s or{},



originalContext=nil,
}
end

local function mountFunctionVirtualNode(p)
local q=p.currentElement

local r=q.component(q.props)

updateVirtualNodeWithRenderResult(p,p.hostParent,r)
end

local function mountPortalVirtualNode(p)
local q=p.currentElement

local r=q.props.target
local s=q.props[e]

assert(k.isHostObject(r),"Expected target to be host object")

updateVirtualNodeWithChildren(p,r,s)
end

local function mountFragmentVirtualNode(p)
local q=p.currentElement
local r=q.elements

updateVirtualNodeWithChildren(p,p.hostParent,r)
end





function m(p,q,r,s,t)
if i.internalTypeChecks then
g(
k.isHostObject(q)or q==nil,
"Expected arg #2 to be a host object"
)
g(
typeof(t)=="table"or t==nil,
"Expected arg #5 to be of type table or nil"
)
end
if i.typeChecks then
assert(r~=nil,"Expected arg #3 to be non-nil")
assert(
b.of(p)==b.Element or typeof(p)=="boolean",
"Expected arg #1 to be of type Element or boolean"
)
end


if typeof(p)=="boolean"then
return nil
end

local u=c.of(p)

local v=createVirtualNode(p,q,r,s,t)

if u==c.Host then
k.mountHostNode(l,v)
elseif u==c.Function then
mountFunctionVirtualNode(v)
elseif u==c.Stateful then
p.component:__mount(l,v)
elseif u==c.Portal then
mountPortalVirtualNode(v)
elseif u==c.Fragment then
mountFragmentVirtualNode(v)
else
error(("Unknown ElementKind %q"):format(tostring(u)),2)
end

return v
end





local function mountVirtualTree(p,q,r)
if i.typeChecks then
assert(b.of(p)==b.Element,"Expected arg #1 to be of type Element")
assert(k.isHostObject(q)or q==nil,"Expected arg #2 to be a host object")
end

if r==nil then
r="RoactTree"
end

local s={
[b]=b.VirtualTree,
[j]={


rootNode=nil,
mounted=true,
},
}

s[j].rootNode=m(p,q,r)

return s
end







local function unmountVirtualTree(p)
local q=p[j]
if i.typeChecks then
assert(b.of(p)==b.VirtualTree,"Expected arg #1 to be a Roact handle")
assert(q.mounted,"Cannot unmounted a Roact tree that has already been unmounted")
end

q.mounted=false

if q.rootNode~=nil then
o(q.rootNode)
end
end





local function updateVirtualTree(p,q)
local r=p[j]
if i.typeChecks then
assert(b.of(p)==b.VirtualTree,"Expected arg #1 to be a Roact handle")
assert(b.of(q)==b.Element,"Expected arg #2 to be a Roact Element")
end

r.rootNode=n(r.rootNode,q)

return p
end

l={
mountVirtualTree=mountVirtualTree,
unmountVirtualTree=unmountVirtualTree,
updateVirtualTree=updateVirtualTree,

createVirtualNode=createVirtualNode,
mountVirtualNode=m,
unmountVirtualNode=o,
updateVirtualNode=n,
updateVirtualNodeWithChildren=updateVirtualNodeWithChildren,
updateVirtualNodeWithRenderResult=updateVirtualNodeWithRenderResult,
}

return l
end

return createReconciler end function a.l()











local b=true



local c={}


local d={}





local function indent(e,f)
local g=("\t"):rep(f)

return g..e:gsub("\n","\n"..g)
end





local function indentLines(e,f)
local g={}

for i,j in ipairs(e)do
table.insert(g,indent(j,f))
end

return table.concat(g,"\n")
end

local e={}





function e.__tostring(f)
local g={"LogInfo {"}

local i=#f.errors
local j=#f.warnings
local k=#f.infos

if i+j+k==0 then
table.insert(g,"\t(no messages)")
end

if i>0 then
table.insert(g,("\tErrors (%d) {"):format(i))
table.insert(g,indentLines(f.errors,2))
table.insert(g,"\t}")
end

if j>0 then
table.insert(g,("\tWarnings (%d) {"):format(j))
table.insert(g,indentLines(f.warnings,2))
table.insert(g,"\t}")
end

if k>0 then
table.insert(g,("\tInfos (%d) {"):format(k))
table.insert(g,indentLines(f.infos,2))
table.insert(g,"\t}")
end

table.insert(g,"}")

return table.concat(g,"\n")
end

local function createLogInfo()
local f={
errors={},
warnings={},
infos={},
}

setmetatable(f,e)

return f
end

local f={}








function f.capture(g)
local i=createLogInfo()

local j=b
b=false
c[i]=true

local k,l=pcall(g)

c[i]=nil
b=j

assert(k,l)

return i
end




function f.warn(g,...)
local i=g:format(...)

for j in pairs(c)do
table.insert(j.warnings,i)
end


local j=debug.traceback("",2):sub(2)
local k=("%s\n%s"):format(i,indent(j,1))

if b then
warn(k)
end
end








function f.warnOnce(g,...)
local i=debug.traceback()

if d[i]then
return
end

d[i]=true
f.warn(g,...)
end

return f end function a.m()






local b=a.load'l'

local c=[[
Roact.reify has been renamed to Roact.mount and will be removed in a future release.
Check the call to Roact.reify at:
]]

local d=[[
Roact.teardown has been renamed to Roact.unmount and will be removed in a future release.
Check the call to Roact.teardown at:
]]

local e=[[
Roact.reconcile has been renamed to Roact.update and will be removed in a future release.
Check the call to Roact.reconcile at:
]]

local function createReconcilerCompat(f)
local g={}

function g.reify(...)
b.warnOnce(c)

return f.mountVirtualTree(...)
end

function g.teardown(...)
b.warnOnce(d)

return f.unmountVirtualTree(...)
end

function g.reconcile(...)
b.warnOnce(e)

return f.updateVirtualTree(...)
end

return g
end

return createReconcilerCompat end function a.n()















local function createSignal()
local b={}
local c={}
local d=false

local function subscribe(e,f)
assert(typeof(f)=="function","Can only subscribe to signals with a function.")

local g={
callback=f,
disconnected=false,
}



if d and not b[f]then
c[f]=g
end

b[f]=g

local function disconnect()
assert(not g.disconnected,"Listeners can only be disconnected once.")

g.disconnected=true
b[f]=nil
c[f]=nil
end

return disconnect
end

local function fire(e,...)
d=true
for f,g in pairs(b)do
if not g.disconnected and not c[f]then
f(...)
end
end

d=false

for f,g in pairs(c)do
c[f]=nil
end
end

return{
subscribe=subscribe,
fire=fire,
}
end

return createSignal end function a.o()

local b=a.load'n'
local c=a.load'c'
local d=a.load'e'

local e=a.load'b'.get()

local f=c.named"BindingImpl"

local g={}

local i={}

function i.getValue(j)
return g.getValue(j)
end

function i.map(j,k)
return g.map(j,k)
end

local j={
__index=i,
__tostring=function(j)
return string.format("RoactBinding(%s)",tostring(j:getValue()))
end,
}

function g.update(k,l)
return k[f].update(l)
end

function g.subscribe(k,l)
return k[f].subscribe(l)
end

function g.getValue(k)
return k[f].getValue()
end

function g.create(k)
local l={
value=k,
changeSignal=b(),
}

function l.subscribe(m)
return l.changeSignal:subscribe(m)
end

function l.update(m)
l.value=m
l.changeSignal:fire(m)
end

function l.getValue()
return l.value
end

return setmetatable({
[d]=d.Binding,
[f]=l,
},j),l.update
end

function g.map(k,l)
if e.typeChecks then
assert(d.of(k)==d.Binding,"Expected arg #1 to be a binding")
assert(typeof(l)=="function","Expected arg #1 to be a function")
end

local m={}

function m.subscribe(n)
return g.subscribe(k,function(o)
n(l(o))
end)
end

function m.update(n)
error("Bindings created by Binding:map(fn) cannot be updated directly",2)
end

function m.getValue()
return l(k:getValue())
end

return setmetatable({
[d]=d.Binding,
[f]=m,
},j)
end

function g.join(k)
if e.typeChecks then
assert(typeof(k)=="table","Expected arg #1 to be of type table")

for l,m in pairs(k)do
if d.of(m)~=d.Binding then
local n=("Expected arg #1 to contain only bindings, but key %q had a non-binding value"):format(
tostring(l)
)
error(n,2)
end
end
end

local l={}

local function getValue()
local m={}

for n,o in pairs(k)do
m[n]=o:getValue()
end

return m
end

function l.subscribe(m)
local n={}

for o,p in pairs(k)do
n[o]=g.subscribe(p,function(q)
m(getValue())
end)
end

return function()
if n==nil then
return
end

for o,p in pairs(n)do
p()
end

n=nil::any
end
end

function l.update(m)
error("Bindings created by joinBindings(...) cannot be updated directly",2)
end

function l.getValue()
return getValue()
end

return setmetatable({
[d]=d.Binding,
[f]=l,
},j)
end

return g end function a.p()





local b=a.load'l'

local c="Change."

local d={

Disabled="Disabled",


Suspended="Suspended",


Enabled="Enabled",
}

local e={}
e.__index=e

function e.new(f)
local g=setmetatable({

_suspendedEventQueue={},



_connections={},




_listeners={},



_status=d.Disabled,


_isResuming=false,


_instance=f,
},e)

return g
end

function e.connectEvent(f,g,i)
f:_connect(g,f._instance[g],i)
end

function e.connectPropertyChange(f,g,i)
local j,k=pcall(function()
return f._instance:GetPropertyChangedSignal(g)
end)

if not j then
error(("Cannot get changed signal on property %q: %s"):format(tostring(g),k),0)
end

f:_connect(c..g,k,i)
end

function e._connect(f,g,i,j)

if j==nil then
if f._connections[g]~=nil then
f._connections[g]:Disconnect()
f._connections[g]=nil
end

f._listeners[g]=nil
else
if f._connections[g]==nil then
f._connections[g]=i:Connect(function(...)
if f._status==d.Enabled then
f._listeners[g](f._instance,...)
elseif f._status==d.Suspended then



local k=select("#",...)
table.insert(f._suspendedEventQueue,{g,k,...})
end
end)
end

f._listeners[g]=j
end
end

function e.suspend(f)
f._status=d.Suspended
end

function e.resume(f)


if f._isResuming then
return
end

f._isResuming=true

local g=1



while g<=#f._suspendedEventQueue do
local i=f._suspendedEventQueue[g]
local j=f._listeners[i[1] ]
local k=i[2]



if j~=nil then


local l=coroutine.create(j)
local m,n=coroutine.resume(
l,
f._instance,
unpack(i,3,2+k)
)




if not m then
b.warn("%s",n)
end
end

g=g+1
end

f._isResuming=false
f._status=d.Enabled
f._suspendedEventQueue={}
end

return e end function a.q()











local b=a.load'c'

local c=b.named"Nil"
local d={}

local function getDefaultInstanceProperty(e,f)
local g=d[e]

if g then
local i=g[f]



if i==c then
return true,nil
end

if i~=nil then
return true,i
end
else
g={}
d[e]=g
end

local i=Instance.new(e)
local j,k=pcall(function()
return i[f]
end)

i:Destroy()

if j then
if k==nil then
g[f]=c
else
g[f]=k
end
end

return j,k
end

return getDefaultInstanceProperty end function a.r()

local b=a.load'c'

local c=b.named"Ref"

return c end function a.s()







local b=a.load'o'
local c=a.load'i'
local d=a.load'g'
local e=a.load'p'
local f=a.load'q'
local g=a.load'r'
local i=a.load'e'
local j=a.load'j'

local k=a.load'b'.get()


local l=[[
Error applying props:
	%s
In element:
%s
]]

local m=[[
Error updating props:
	%s
In element:
%s
]]

local function identity(...)
return...
end

local function applyRef(n,o)
if n==nil then
return
end

if typeof(n)=="function"then
n(o)
elseif i.of(n)==i.Binding then
b.update(n,o)
else

error(("Invalid ref: Expected type Binding but got %s"):format(typeof(n)))
end
end

local function setRobloxInstanceProperty(n,o,p)
if p==nil then
local q=n.ClassName local
r, s=f(q,o)
p=s
end


n[o]=p

return
end

local function removeBinding(n,o)
local p=n.bindings[o]
p()
n.bindings[o]=nil
end

local function attachBinding(n,o,p)
local function updateBoundProperty(q)
local r,s=xpcall(function()
setRobloxInstanceProperty(n.hostObject,o,q)
end,identity)

if not r then
local t=n.currentElement.source

if t==nil then
t="<enable element tracebacks>"
end

local u=m:format(s,t)
error(u,0)
end
end

if n.bindings==nil then
n.bindings={}
end

n.bindings[o]=b.subscribe(p,updateBoundProperty)

updateBoundProperty(p:getValue())
end

local function detachAllBindings(n)
if n.bindings~=nil then
for o,p in pairs(n.bindings)do
p()
end
n.bindings=nil
end
end

local function applyProp(n,o,p,q)
if p==q then
return
end

if o==g or o==c then

return
end

local r=i.of(o)

if r==i.HostEvent or r==i.HostChangeEvent then
if n.eventManager==nil then
n.eventManager=e.new(n.hostObject)
end

local s=o.name

if r==i.HostChangeEvent then
n.eventManager:connectPropertyChange(s,p)
else
n.eventManager:connectEvent(s,p)
end

return
end

local s=i.of(p)==i.Binding
local t=i.of(q)==i.Binding

if t then
removeBinding(n,o)
end

if s then
attachBinding(n,o,p)
else
setRobloxInstanceProperty(n.hostObject,o,p)
end
end

local function applyProps(n,o)
for p,q in pairs(o)do
applyProp(n,p,q,nil)
end
end

local function updateProps(n,o,p)

for q,r in pairs(p)do
local s=o[q]

applyProp(n,q,r,s)
end


for q,r in pairs(o)do
local s=p[q]

if s==nil then
applyProp(n,q,nil,r)
end
end
end

local n={}

function n.isHostObject(o)
return typeof(o)=="Instance"
end

function n.mountHostNode(o,p)
local q=p.currentElement
local r=p.hostParent
local s=p.hostKey

if k.internalTypeChecks then
j(d.of(q)==d.Host,"Element at given node is not a host Element")
end
if k.typeChecks then
assert(q.props.Name==nil,"Name can not be specified as a prop to a host component in Roact.")
assert(q.props.Parent==nil,"Parent can not be specified as a prop to a host component in Roact.")
end

local t=Instance.new(q.component)
p.hostObject=t

local u,v=xpcall(function()
applyProps(p,q.props)
end,identity)

if not u then
local w=q.source

if w==nil then
w="<enable element tracebacks>"
end

local x=l:format(v,w)
error(x,0)
end

t.Name=tostring(s)

local w=q.props[c]

if w~=nil then
o.updateVirtualNodeWithChildren(p,p.hostObject,w)
end

t.Parent=r
p.hostObject=t

applyRef(q.props[g],t)

if p.eventManager~=nil then
p.eventManager:resume()
end
end

function n.unmountHostNode(o,p)
local q=p.currentElement

applyRef(q.props[g],nil)

for r,s in pairs(p.children)do
o.unmountVirtualNode(s)
end

detachAllBindings(p)

p.hostObject:Destroy()
end

function n.updateHostNode(o,p,q)
local r=p.currentElement.props
local s=q.props

if p.eventManager~=nil then
p.eventManager:suspend()
end


if r[g]~=s[g]then
applyRef(r[g],nil)
applyRef(s[g],p.hostObject)
end

local t,u=xpcall(function()
updateProps(p,r,s)
end,identity)

if not t then
local v=q.source

if v==nil then
v="<enable element tracebacks>"
end

local w=m:format(u,v)
error(w,0)
end

local v=q.props[c]
if v~=nil or r[c]~=nil then
o.updateVirtualNodeWithChildren(p,p.hostObject,v)
end

if p.eventManager~=nil then
p.eventManager:resume()
end

return p
end

return n end function a.t()

local b=a.load'c'



local c=b.named"None"

return c end function a.u()

local b=a.load't'







local function assign(c,...)
for d=1,select("#",...)do
local e=select(d,...)

if e~=nil then
for f,g in pairs(e)do
if g==b then
c[f]=nil
else
c[f]=g
end
end
end
end

return c
end

return assign end function a.v()

local b=a.load'c'
local c=a.load'd'


local d=c({

Init=b.named"init",
Render=b.named"render",
ShouldUpdate=b.named"shouldUpdate",
WillUpdate=b.named"willUpdate",
DidMount=b.named"didMount",
DidUpdate=b.named"didUpdate",
WillUnmount=b.named"willUnmount",


ReconcileChildren=b.named"reconcileChildren",
Idle=b.named"idle",
},"ComponentLifecyclePhase")

return d end function a.w()








local b=a.load'v'

local c={}

c[b.WillUpdate]=[[
setState cannot be used in the willUpdate lifecycle method.
Consider using the didUpdate method instead, or using getDerivedStateFromProps.

Check the definition of willUpdate in the component %q.]]

c[b.ShouldUpdate]=[[
setState cannot be used in the shouldUpdate lifecycle method.
shouldUpdate must be a pure function that only depends on props and state.

Check the definition of shouldUpdate in the component %q.]]

c[b.Render]=[[
setState cannot be used in the render method.
render must be a pure function that only depends on props and state.

Check the definition of render in the component %q.]]

c.default=[[
setState can not be used in the current situation, because Roact doesn't know
which part of the lifecycle this component is in.

This is a bug in Roact.
It was triggered by the component %q.
]]

return c end function a.x()

local b=a.load'u'
local c=a.load'v'
local d=a.load'e'
local e=a.load'c'
local f=a.load'w'
local g=a.load'j'

local i=a.load'b'.get()






local j=100

local k=e.named"InternalData"

local l=[[
The component %q is missing the `render` method.
`render` must be defined when creating a Roact component!]]

local m=[[
The component %q has reached the setState update recursion limit.
When using `setState` in `didUpdate`, make sure that it won't repeat infinitely!]]

local n={}

function n.__tostring(o)
return o.__componentName
end

local o={}
setmetatable(o,n)

o[d]=d.StatefulComponentClass
o.__index=o
o.__componentName="Component"






function o.extend(p,q)
if i.typeChecks then
assert(d.of(p)==d.StatefulComponentClass,"Invalid `self` argument to `extend`.")
assert(typeof(q)=="string","Component class name must be a string")
end

local r={}

for s,t in pairs(p)do



if s~="extend"then
r[s]=t
end
end

r[d]=d.StatefulComponentClass
r.__index=r
r.__componentName=q

setmetatable(r,n)

return r
end

function o.__getDerivedState(p,q,r)
if i.internalTypeChecks then
g(d.of(p)==d.StatefulComponentInstance,"Invalid use of `__getDerivedState`")
end

local s=p[k]
local t=s.componentClass

if t.getDerivedStateFromProps~=nil then
local u=t.getDerivedStateFromProps(q,r)

if u~=nil then
if i.typeChecks then
assert(typeof(u)=="table","getDerivedStateFromProps must return a table!")
end

return u
end
end

return nil
end

function o.setState(p,q)
if i.typeChecks then
assert(d.of(p)==d.StatefulComponentInstance,"Invalid `self` argument to `extend`.")
end

local r=p[k]
local s=r.lifecyclePhase






if
s==c.ShouldUpdate
or s==c.WillUpdate
or s==c.Render
then
local t=f[r.lifecyclePhase]

local u=t:format(tostring(r.componentClass))
error(u,2)
elseif s==c.WillUnmount then

return
end

local t=r.pendingState

local u
if typeof(q)=="function"then
u=q(t or p.state,p.props)


if u==nil then
return
end
elseif typeof(q)=="table"then
u=q
else
error("Invalid argument to setState, expected function or table",2)
end

local v
if t~=nil then
v=b(t,u)
else
v=b({},p.state,u)
end

if s==c.Init then

local w=p:__getDerivedState(p.props,v)
p.state=b(v,w)
elseif
s==c.DidMount
or s==c.DidUpdate
or s==c.ReconcileChildren
then





local w=p:__getDerivedState(p.props,v)
r.pendingState=b(v,w)
elseif s==c.Idle then

p:__update(nil,v)
else
local w=f.default

local x=w:format(tostring(r.componentClass))

error(x,2)
end
end







function o.getElementTraceback(p)
return p[k].virtualNode.currentElement.source
end








function o.render(p)
local q=p[k]

local r=l:format(tostring(q.componentClass))

error(r,0)
end





function o.__getContext(p,q)
if i.internalTypeChecks then
g(d.of(p)==d.StatefulComponentInstance,"Invalid use of `__getContext`")
g(q~=nil,"Context key cannot be nil")
end

local r=p[k].virtualNode
local s=r.context

return s[q]
end





function o.__addContext(p,q,r)
if i.internalTypeChecks then
g(d.of(p)==d.StatefulComponentInstance,"Invalid use of `__addContext`")
end
local s=p[k].virtualNode





if s.originalContext==nil then
s.originalContext=s.context
end



local t=s.context
s.context=b({},t,{[q]=r})
end








function o.__validateProps(p,q)
if not i.propValidation then
return
end

local r=p[k].componentClass.validateProps

if r==nil then
return
end

if typeof(r)~="function"then
error(
("validateProps must be a function, but it is a %s.\nCheck the definition of the component %q."):format(
typeof(r),
p.__componentName
)
)
end

local s,t=r(q)

if not s then
t=t or"<Validator function did not supply a message>"
error(
("Property validation failed in %s: %s\n\n%s"):format(
p.__componentName,
tostring(t),
p:getElementTraceback()or"<enable element tracebacks>"
),
0
)
end
end





function o.__mount(p,q,r)
if i.internalTypeChecks then
g(d.of(p)==d.StatefulComponentClass,"Invalid use of `__mount`")
g(d.of(r)==d.VirtualNode,"Expected arg #2 to be of type VirtualNode")
end

local s=r.currentElement
local t=r.hostParent



local u={
reconciler=q,
virtualNode=r,
componentClass=p,
lifecyclePhase=c.Init,
pendingState=nil,
}

local v={
[d]=d.StatefulComponentInstance,
[k]=u,
}

setmetatable(v,p)

r.instance=v

local w=s.props

if p.defaultProps~=nil then
w=b({},p.defaultProps,w)
end

v:__validateProps(w)

v.props=w

local x=b({},r.legacyContext)
v._context=x

v.state=b({},v:__getDerivedState(v.props,{}))

if v.init~=nil then
v:init(v.props)
b(v.state,v:__getDerivedState(v.props,v.state))
end


r.legacyContext=v._context

u.lifecyclePhase=c.Render
local y=v:render()

u.lifecyclePhase=c.ReconcileChildren
q.updateVirtualNodeWithRenderResult(r,t,y)

if v.didMount~=nil then
u.lifecyclePhase=c.DidMount
v:didMount()
end

if u.pendingState~=nil then

v:__update(nil,nil)
end

u.lifecyclePhase=c.Idle
end





function o.__unmount(p)
if i.internalTypeChecks then
g(d.of(p)==d.StatefulComponentInstance,"Invalid use of `__unmount`")
end

local q=p[k]
local r=q.virtualNode
local s=q.reconciler

if p.willUnmount~=nil then
q.lifecyclePhase=c.WillUnmount
p:willUnmount()
end

for t,u in pairs(r.children)do
s.unmountVirtualNode(u)
end
end







function o.__update(p,q,r)
if i.internalTypeChecks then
g(d.of(p)==d.StatefulComponentInstance,"Invalid use of `__update`")
g(
d.of(q)==d.Element or q==nil,
"Expected arg #1 to be of type Element or nil"
)
g(
typeof(r)=="table"or r==nil,
"Expected arg #2 to be of type table or nil"
)
end

local s=p[k]
local t=s.componentClass

local u=p.props
if q~=nil then
u=q.props

if t.defaultProps~=nil then
u=b({},t.defaultProps,u)
end

p:__validateProps(u)
end

local v=0
repeat
local w
local x


if s.pendingState~=nil then
x=s.pendingState
s.pendingState=nil
end


if r~=nil or u~=p.props then
if x==nil then
w=r or p.state
else
w=b(x,r)
end

local y=p:__getDerivedState(u,w)

if y~=nil then
w=b({},w,y)
end

r=nil
else
w=x
end

if not p:__resolveUpdate(u,w)then

return false
end

v=v+1

if v>j then
error(m:format(tostring(s.componentClass)),3)
end
until s.pendingState==nil

return true
end






function o.__resolveUpdate(p,q,r)
if i.internalTypeChecks then
g(d.of(p)==d.StatefulComponentInstance,"Invalid use of `__resolveUpdate`")
end

local s=p[k]
local t=s.virtualNode
local u=s.reconciler

local v=p.props
local w=p.state

if q==nil then
q=v
end
if r==nil then
r=w
end

if p.shouldUpdate~=nil then
s.lifecyclePhase=c.ShouldUpdate
local x=p:shouldUpdate(q,r)

if not x then
s.lifecyclePhase=c.Idle
return false
end
end

if p.willUpdate~=nil then
s.lifecyclePhase=c.WillUpdate
p:willUpdate(q,r)
end

s.lifecyclePhase=c.Render

p.props=q
p.state=r

local x=t.instance:render()

s.lifecyclePhase=c.ReconcileChildren
u.updateVirtualNodeWithRenderResult(t,t.hostParent,x)

if p.didUpdate~=nil then
s.lifecyclePhase=c.DidUpdate
p:didUpdate(v,w)
end

s.lifecyclePhase=c.Idle
return true
end

return o end function a.y()

local b=a.load'i'
local c=a.load'g'
local d=a.load'l'
local e=a.load'e'

local f=a.load'b'.get()

local g=[[
The prop `Roact.Children` was defined but was overridden by the third parameter to createElement!
This can happen when a component passes props through to a child element but also uses the `children` argument:

	Roact.createElement("Frame", passedProps, {
		child = ...
	})

Instead, consider using a utility function to merge tables of children together:

	local children = mergeTables(passedProps[Roact.Children], {
		child = ...
	})

	local fullProps = mergeTables(passedProps, {
		[Roact.Children] = children
	})

	Roact.createElement("Frame", fullProps)]]










local function createElement(i,j,k)
if f.typeChecks then
assert(i~=nil,"`component` is required")
assert(typeof(j)=="table"or j==nil,"`props` must be a table or nil")
assert(typeof(k)=="table"or k==nil,"`children` must be a table or nil")
end

if j==nil then
j={}
end

if k~=nil then
if j[b]~=nil then
d.warnOnce(g)
end

j[b]=k
end

local l=c.fromComponent(i)

local m={
[e]=e.Element,
[c]=l,
component=i,
props=j,
}

if f.elementTracing then


m.source=debug.traceback("",2):sub(2)
end

return m
end

return createElement end function a.z()

local b=a.load'g'
local c=a.load'e'

local function createFragment(d)
return{
[c]=c.Element,
[b]=b.Fragment,
elements=d,
}
end

return createFragment end function a.A()








local function oneChild(b)
if not b then
return nil
end

local c,d=next(b)

if not d then
return nil
end

local e=next(b,c)

if e then
error("Expected at most child, had more than one child.",2)
end

return d
end

return oneChild end function a.B()






local b=a.load'x'

local c=b:extend"PureComponent"




c.extend=b.extend

function c.shouldUpdate(d,e,f)


if f~=d.state then
return true
end

if e==d.props then
return false
end

for g,i in pairs(e)do
if d.props[g]~=i then
return true
end
end

for g,i in pairs(d.props)do
if e[g]~=i then
return true
end
end

return false
end

return c end function a.C()





local b=a.load'o'

local function createRef()local
c, d=b.create(nil)

local e={}




setmetatable(e,{
__index=function(f,g)
if g=="current"then
return c:getValue()
else
return c[g]
end
end,
__newindex=function(f,g,i)
if g=="current"then
error("Cannot assign to the 'current' property of refs",2)
end

c[g]=i
end,
__tostring=function(f)
return("RoactRef(%s)"):format(tostring(c:getValue()))
end,
})

return e
end

return createRef end function a.D()

local b=a.load'u'
local c=a.load't'
local d=a.load'r'

local e=a.load'b'.get()


local f={
[d]=c,
}





local function forwardRef(g)
if e.typeChecks then
assert(typeof(g)=="function","Expected arg #1 to be a function")
end

return function(i)
local j=i[d]
local k=b({},i,f)

return g(k,j)
end
end

return forwardRef end function a.E()

local b=a.load'c'
local c=a.load'z'
local d=a.load'n'
local e=a.load'i'
local f=a.load'x'





local function createContextEntry(g)
return{
value=g,
onUpdate=d(),
}
end

local function createProvider(g)
local i=f:extend"Provider"

function i.init(j,k)
j.contextEntry=createContextEntry(k.value)
j:__addContext(g.key,j.contextEntry)
end

function i.willUpdate(j,k)





if k.value~=j.props.value then
j.contextEntry.value=k.value
end
end

function i.didUpdate(j,k)









if k.value~=j.props.value then
j.contextEntry.onUpdate:fire(j.props.value)
end
end

function i.render(j)
return c(j.props[e])
end

return i
end

local function createConsumer(g)
local i=f:extend"Consumer"

function i.validateProps(j)
if type(j.render)~="function"then
return false,"Consumer expects a `render` function"
else
return true
end
end

function i.init(j,k)


j.contextEntry=j:__getContext(g.key)
end

function i.render(j)




local k
if j.contextEntry~=nil then
k=j.contextEntry.value
else
k=g.defaultValue
end

return j.props.render(k)
end

function i.didUpdate(j)



if j.contextEntry~=nil then
j.lastValue=j.contextEntry.value
end
end

function i.didMount(j)
if j.contextEntry~=nil then









j.disconnect=j.contextEntry.onUpdate:subscribe(function(k)
if k~=j.lastValue then

j:setState{}
end
end)
end
end

function i.willUnmount(j)
if j.disconnect~=nil then
j.disconnect()
j.disconnect=nil
end
end

return i
end

local g={}
g.__index=g

function g.new(i)
return setmetatable({
defaultValue=i,
key=b.named"ContextKey",
},g)
end

function g.__tostring(i)
return"RoactContext"
end

local function createContext(i)
local j=g.new(i)

return{
Provider=createProvider(j),
Consumer=createConsumer(j),
}
end

return createContext end function a.F()














local b=a.load'e'

local c={}

local d={
__tostring=function(d)
return("RoactHostChangeEvent(%s)"):format(d.name)
end,
}

setmetatable(c,{
__index=function(e,f)
local g={
[b]=b.HostChangeEvent,
name=f,
}

setmetatable(g,d)
c[f]=g

return g
end,
})

return c end function a.G()
















local b=a.load'e'

local c={}

local d={
__tostring=function(d)
return("RoactHostEvent(%s)"):format(d.name)
end,
}

setmetatable(c,{
__index=function(e,f)
local g={
[b]=b.HostEvent,
name=f,
}

setmetatable(g,d)

c[f]=g

return g
end,
})

return c end end






local b=a.load'b'
local c=a.load'k'
local d=a.load'm'
local e=a.load's'
local f=a.load'd'
local g=a.load'o'

local i=c(e)
local j=d(i)

local k=f{
Component=a.load'x',
createElement=a.load'y',
createFragment=a.load'z',
oneChild=a.load'A',
PureComponent=a.load'B',
None=a.load't',
Portal=a.load'f',
createRef=a.load'C',
forwardRef=a.load'D',
createBinding=g.create,
joinBindings=g.join,
createContext=a.load'E',

Change=a.load'F',
Children=a.load'i',
Event=a.load'G',
Ref=a.load'r',

mount=i.mountVirtualTree,
unmount=i.unmountVirtualTree,
update=i.updateVirtualTree,

reify=j.reify,
teardown=j.teardown,
reconcile=j.reconcile,

setGlobalConfig=b.set,


UNSTABLE={},
}

return k