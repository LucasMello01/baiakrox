function onDeath(cid, corpse, killer)
 
local pos = getCreaturePosition(cid)
local monster = 'a morte' -- criatura
local timer = 3 -- quanto tempo vai demorar pra sumir
 
   function removeMonster()
     for _, pid in ipairs(getCreatureSummons(killer[1])) do
       doRemoveCreature(pid)
     end
   return true
   end
 
if isPlayer(cid) and isPlayer(killer[1]) then
   doConvinceCreature(killer[1], doCreateMonster(monster, pos))
   doSendAnimatedText(getThingPos(cid), "DEATH", 19) -- O "death" é  a frase que irá aparece em cima do corpo
   doSendMagicEffect(getThingPos(cid), 65)
   addEvent(removeMonster, timer*1000)
end
 
return true
end