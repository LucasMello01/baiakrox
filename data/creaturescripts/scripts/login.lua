function onLogin(cid)
	
	if(getConfigValue('deathLostPercent') ~= nil) then
		doPlayerSetLossPercent(cid, PLAYERLOSS_EXPERIENCE, getConfigValue('deathLostPercent') * 10) 
	end

	if(getPlayerAccountManager(cid) == MANAGER_NONE) then	
		if(getPlayerLastLoginSaved(cid) > 0) then
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_DEFAULT, "Your last visit was on " .. os.date("%a %b %d %X %Y", getPlayerLastLoginSaved(cid)) .. ".")
		else
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_DEFAULT, "Please choose your outfit.")
			doPlayerSendOutfitWindow(cid)
		end	
	elseif(getPlayerAccountManager(cid) == MANAGER_NAMELOCK) then
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Hello, it appears that your character has been namelocked, what would you like as your new name?")
	elseif(getPlayerAccountManager(cid) == MANAGER_ACCOUNT) then
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Hello, type [account] to manage your account and if you want to start over then type [cancel].")
	else
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Hello, type [account] to create an account or type [recover] to recover an account.")
	end

	if(not isPlayerGhost(cid)) then
		doSendMagicEffect(getCreaturePosition(cid), CONST_ME_TELEPORT)
	end

        registerCreatureEvent(cid, "critical")
        if getPlayerStorageValue(cid, 48903) == -1 then
        setPlayerStorageValue(cid, 48903, 0) 
         end 

	registerCreatureEvent(cid, "Mail")
        registerCreatureEvent(cid, "tkexp")
        registerCreatureEvent(cid, "castleexp")
        registerCreatureEvent(cid, "DeathSystem")
        registerCreatureEvent(cid, "DeathC")
        registerCreatureEvent(cid, "Antimagebomb")
        registerCreatureEvent(cid, "UpAbsolute")
        registerCreatureEvent(cid, "DoubleExp")
        registerCreatureEvent(cid, "pvpsystem")
        registerCreatureEvent(cid, "SaveLogout")
        registerCreatureEvent(cid, "RushCombat")
        registerCreatureEvent(cid, "RushAttack")
        registerCreatureEvent(cid, "RushDead")
        registerCreatureEvent(cid, "RushOutfit")
	registerCreatureEvent(cid, "GuildMotd")
	registerCreatureEvent(cid, "killer")
	registerCreatureEvent(cid, "Idle")
	registerCreatureEvent(cid, "antiacc")
	registerCreatureEvent(cid, "TiraBattle")
	registerCreatureEvent(cid, "CombatDodge")
	registerCreatureEvent(cid, "attackguild")
	registerCreatureEvent(cid, "advance")
	registerCreatureEvent(cid, "FimVip")
	registerCreatureEvent(cid, "forever amulet")
	registerCreatureEvent(cid, "SkullCheck")
	registerCreatureEvent(cid, "ReportBug")
	registerCreatureEvent(cid, "VipReceive")
	registerCreatureEvent(cid, "PlayerKill")
	
	return true
end