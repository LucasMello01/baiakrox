local config = {
positions = {
["BestBaiak"] = { x = 157, y = 51, z = 7 },
}
}

function onThink(cid, interval, lastExecution)
for text, pos in pairs(config.positions) do
doSendAnimatedText(pos, text, 89)
end

return TRUE
end 

