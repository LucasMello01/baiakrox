function onUse(cid, item, frompos, item2, topos)
doBroadcastMessage("Os Geradores Vermelho invadiu a City principal.")
	pos1 = {x=159,y=37,z=7}
if item.uid == 19223 then	
   doSummonCreature("Gerador Vermelho", pos1)   
   
end
end