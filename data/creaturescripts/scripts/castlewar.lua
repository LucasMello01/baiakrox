local pos = {x=160, y=54, z=7}

pos = {x=160, y=54, z=7}

function onLogin(cid)
	if vip.hasVip(cid) == true then
		if getPlayerStorageValue(cid,4538) ~= 1 then
			setPlayerStorageValue(cid,4538,1)
		end
    elseif vip.hasVip(cid) ~= true and vip.getVip(cid) ~= 0 then
		if getPlayerStorageValue(cid,4538) == 1 then
			doTeleportThing(cid, pos, true)
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Sua guild perdeu o Castle 24 HRS!")
			doPlayerSendTextMessage(cid,22,"Sua guild perdeu o Castle 24 HRS!")
			setPlayerPromotionLevel(cid, 1)
			setPlayerStorageValue(cid,4538,2)
		elseif getPlayerStorageValue(cid,4538) == -1 then
			setPlayerStorageValue(cid,4538,2)
		end

	end

    return true
end

