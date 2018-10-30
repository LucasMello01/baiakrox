local config = {
positions = {
["F.Storm"] = { x = 42, y = 146, z = 7 },
["T.Battle"] = { x = 32, y = 143, z = 7 },
["D.Towers"] = { x = 36, y = 151, z = 7 },
["Zombie"] = { x = 42, y = 148, z = 7 },
["Desert"] = { x = 40, y = 151, z = 7 },
["Rotworms"] = { x = 155, y = 48, z = 7 },
["Castle24Hrs"] = { x = 148, y = 48, z = 7 },
["Quests"] = { x = 154, y = 48, z = 7 },
["Depot"] = { x = 145, y = 53, z = 7 },
["~"] = { x = 146, y = 50, z = 7 },
["Vip I"] = { x = 141, y = 47, z = 7 },
["SuperUP"] = { x = 151, y = 48, z = 7 },
["Vip II"] = { x = 143, y = 47, z = 7 },
["Donate"] = { x = 151, y = 53, z = 7 },
["B.Field"] = { x = 39, y = 142, z = 7 },
["NewCastle"] = { x = 164, y = 54, z = 7 },
["CTF"] = { x = 35, y = 142, z = 7 },
["Hunts"] = { x = 153, y = 48, z = 7 },
["1"] = {x = 2321, y = 481, z = 7},
["2"] = {x = 2324, y = 481, z = 7},
["3"] = {x = 2327, y = 481, z = 7},
["4"] = {x = 2330, y = 481, z = 7},
["5"] = {x = 2333, y = 481, z = 7},
["6"] = {x = 2321, y = 489, z = 7},
["7"] = {x = 2324, y = 489, z = 7},
["8"] = {x = 2327, y = 489, z = 7},
["9"] = {x = 2330, y = 489, z = 7},
["10"] = {x = 2333, y = 489, z = 7},
["11"] = {x = 2336, y = 481, z = 7},
["12"] = {x = 2339, y = 481, z = 7},
["13"] = {x = 2336, y = 489, z = 7},
["14"] = {x = 2339, y = 489, z = 7},
["14"] = {x = 2339, y = 489, z = 7},
["15"] = {x = 2343, y = 489, z = 7},
["16"] = {x = 2346, y = 489, z = 7},
["17"] = {x = 2342, y = 481, z = 7},
["18"] = {x = 2345, y = 481, z = 7},
["PROMOTION"] = {x = 4422, y = 1290, z = 5},
["EventRoom"] = {x = 162, y = 46, z = 7},
["+Casas"] = {x = 145, y = 54, z = 7},
["MiniGames"] = {x = 145, y = 55, z = 7},
["Rei"] = {x = 166, y = 41, z = 7},
["Treiners"] = {x = 152, y = 48, z = 7},
["NewCity"] = {x = 1913, y = 1594, z = 7},
["Quests "] = {x = 1911, y = 1594, z = 7},
["CLICK"] = {x = 2480, y = 987, z = 7},
["25kk"] = {x = 166, y = 47, z = 7},
["35kk"] = {x = 167, y = 47, z = 7},

}
}

function onThink(cid, interval, lastExecution)
for text, pos in pairs(config.positions) do
doSendAnimatedText(pos, text, 200)
end

return TRUE
end 

