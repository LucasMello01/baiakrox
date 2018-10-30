function onThink(interval, lastExecution)
    local cor = 22 -- Defina a cor da mensagem (22 = branco)
    local mensagens ={
[[[ATENCAO] Não utilizem a mesma senha de outros servidores, evite ser Hack!]]
}
doBroadcastMessage(mensagens[1], cor)
return TRUE
end