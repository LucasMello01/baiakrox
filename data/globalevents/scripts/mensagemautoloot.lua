function onThink(interval, lastExecution)
    local cor = 22 -- Defina a cor da mensagem (22 = branco)
    local mensagens ={
[[[AUTOLOOT] Digite !autoloot para saber como funciona nosso sistema. O autoloot para os free adiciona 1 item na lista e para os donates adiciona 4 itens a lista.]]
}
doBroadcastMessage(mensagens[1], cor)
return TRUE
end