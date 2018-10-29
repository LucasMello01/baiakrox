--BY Mock the bear (MTB)
local IDS = {
[9562] = {'Red',0,15},
[9563] = {'Blue',2,10},
[9564] = {'Purple',3,22},
[9565] = {'Green',1,45}
}
local GAME = {}
local reverse = {[0]=2,[2]=0,[3]=1,[1]=3}
function CP(cpos) -- because getPosByDir is bugged
return {x=cpos.x,y=cpos.y,z=cpos.z}
end
local function gameloop()
if GAME.next then
if GAME.next <= os.time() then
local selected = math.random(9562,9565)
doSendMagicEffect(getPosByDir(CP(GAME.center),IDS[selected][2]),IDS[selected][3])
GAME.delay = os.time()+10 + 5*(#GAME.list+1)
GAME.list[#GAME.list+1] = selected
GAME.next = nil
GAME.pressing = 1
addEvent(doSendAnimatedText,500,CP(GAME.center),'GO!',182)
end
elseif GAME.delay then
if GAME.delay <= os.time() then
doTeleportThing(GAME.cid,GAME.oldpos)
doCreatureSetNoMove(GAME.cid,false)
doPlayerSendCancel(GAME.cid,"Timeout")
GAME = {}
collectgarbage()
return
end
elseif GAME.show then
if GAME.show <= os.time() then
local selected = GAME.list[GAME.show_now]
doSendMagicEffect(getPosByDir(CP(GAME.center),IDS[selected][2]),IDS[selected][3])
GAME.show_now = GAME.show_now+1
GAME.show = os.time()+1
if GAME.show_now > #GAME.list then
GAME.show_now = nil
GAME.show = nil
GAME.next = os.time()+1
end
end
end
addEvent(gameloop,1000)
end
function onUse(cid, item, fromPosition, itemEx, toPosition)
if GAME.begin then
if GAME.cid ~= cid then
return false
else
if GAME.delay then
doSendMagicEffect(getPosByDir(CP(GAME.center),IDS[item.itemid][2]),IDS[item.itemid][3])
if item.itemid == GAME.list[GAME.pressing] then
GAME.pressing = GAME.pressing+1
if GAME.pressing > #GAME.list then
GAME.delay = nil
addEvent(function()
GAME.show = os.time()+2
GAME.show_now = 1
end,1000)
end
else
doPlayerSendCancel(GAME.cid,"WRONG! Your record is "..#GAME.list..".")
doTeleportThing(GAME.cid,GAME.oldpos)
doCreatureSetNoMove(GAME.cid,false)
GAME = {}
collectgarbage()
return
end
end
end
else
if IDS[item.itemid] then
local center = getPosByDir(CP(fromPosition),reverse[IDS[item.itemid][2]])
doSendMagicEffect(center,10)
GAME.oldpos = CP(getCreaturePosition(cid))
doTeleportThing(cid,center)
doCreatureSetNoMove(cid,true)
GAME.begin = true
GAME.next = os.time()+3
GAME.cid = cid
GAME.list = {}
GAME.center = center
GAME.stept = 1
gameloop(cid)
else
error('This itemid do not belong to the action.')
end
end
end