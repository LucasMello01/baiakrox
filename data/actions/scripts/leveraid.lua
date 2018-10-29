function onUse(cid, item, frompos, item2, topos)
doBroadcastMessage("Gerador Vermelho invadiu a City principal.")
	pos1 = {x=137,y=53,z=7}
if item.uid == 19000 then	
   doSummonCreature("Gerador Vermelho", pos1)   
   
end
end