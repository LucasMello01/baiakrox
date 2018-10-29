function executeClean()
	doCleanMap()
	doBroadcastMessage("[AUTO]Mapa Limpo")
	return true
end

function onThink(interval, lastExecution, thinkInterval)
	doBroadcastMessage("[AUTO]Clean")
	addEvent(executeClean, 50000)
	return true
end
