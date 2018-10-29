local config = {
    positions = {
        ["ROX"] = { x = 160, y = 54, z = 7 },
        ["Quests"] = { x = 149, y = 48, z = 7 },
        ["Desert"] = { x = 148, y = 48, z = 7 },
        ["Inquisition"] = { x = 150, y = 48, z = 7 },
        ["Vip2"] = { x = 144, y = 45, z = 7 },
        ["Vip 2"] = { x = 145, y = 45, z = 7 },
        ["Castle24H"] = { x = 153, y = 48, z = 7 },
        ["City War"] = { x = 157, y = 44, z = 7 },
        ["AreaPvp"] = { x = 153, y = 53, z = 7 },       
        ["Teleports"] = { x = 151, y = 48, z = 7 },
        ["VIP 1"] = { x = 153, y = 54, z = 7 },
        ["Depot"] = { x = 153, y = 55, z = 7 },
        ["Donate"] = { x = 153, y = 45, z = 7 },
        ["C.T.F"] = { x = 156, y = 44, z = 7 },
        ["Battle F."] = { x = 158, y = 44, z = 7 },
        ["Treiners"] = { x = 152, y = 48, z = 7 },       
    }
}

function onThink(cid, interval, lastExecution)
    for text, pos in pairs(config.positions) do
        doSendAnimatedText(pos, text, math.random(1, 255))
    end
    
    return TRUE
end