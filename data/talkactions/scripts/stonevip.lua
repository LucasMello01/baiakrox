function onSay(cid, words, param)

if doPlayerRemoveMoney(cid, 500000) == TRUE then
local bp = doPlayerAddItem(cid, 4852, 1)
doSendMagicEffect(getCreaturePosition(cid),39)
doCreatureSay(cid, "VIP 2 basta usar", TALKTYPE_ORANGE_1)
else
doCreatureSay(cid, "Voce nao tem dinheiro suficiente", TALKTYPE_ORANGE_1)
doSendMagicEffect(getPlayerPosition(cid), CONST_ME_POFF)
end
end