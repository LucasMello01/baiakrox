function onUse(cid, item, frompos, item2, topos)
doBroadcastMessage("Os Geradores Vermelho invadiu a City principal.")
	pos1 = {x=197,y=58,z=7}
if item.uid == 19224 then	
   doSummonCreature("Gerador Vermelho", pos1)   
   
end
end