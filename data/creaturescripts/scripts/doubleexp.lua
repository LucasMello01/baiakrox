local function isSummon(cid)
	return cid ~= getCreatureMaster(cid) or false
end

local days = {"saturday", "sunday"} -- {Segunda = Monday, Terça = Tuesday, Quarta = Wednesday, Quinta = Thursday, Sexta = Friday, Sabado = Saturday, Domingo = Sunday}

local percent = 2 -- double

function onKill(cid, target)
    if isPlayer(cid) and getPlayerAccess(cid) < 3 and isMonster(target) and not isSummon(target) then
		for i = 1, #days do
			if os.date("%A"):lower() ~= days[i]:lower() then return true end
		end
		local exp = getExperienceStage(getPlayerLevel(cid), getVocationInfo(getPlayerVocation(cid)).experienceMultiplier)
		local count = math.floor((getMonsterInfo(getCreatureName(target):lower()).experience*exp*percent))
		if getPlayerPremiumDays(cid) > 0 then
			count = count * 2
		end
		doPlayerAddExperience(cid, count)
		addEvent(doSendAnimatedText, 1000, getThingPos(cid), ""..count, COLOR_YELLOW)
	end
    return true
end