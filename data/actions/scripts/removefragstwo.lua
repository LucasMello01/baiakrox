function onUse(cid, item, frompos, item2, topos)
    local skull = getCreatureSkullType(cid)
    local bad_skulls = {SKULL_WHITE,SKULL_RED,SKULL_BLACK}    
            if isInArray(bad_skulls, skull) == true then
                doPlayerSetSkullEnd(cid, 0, skull)
                doRemoveItem(item.uid, 1)
                db.executeQuery('UPDATE `killers`, `player_killers` SET `killers`.`unjustified` = 0 WHERE `killers`.`unjustified` = 1 AND `player_killers`.`player_id` = ' .. getPlayerGUID(cid) .. ' AND `killers`.`id` = `player_killers`.`kill_id`')
                doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Sua skull foi removido com sucesso.")
            else
                doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Voce nao tem skull para ser removida.")
            end
    return true
end