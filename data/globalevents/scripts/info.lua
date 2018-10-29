function onThink(interval, lastExecution)
  -- Configurações
    local cor = 22 -- Defina a cor da mensagem (22 = branco)
    local mensagens ={
[[Voce Esta jogando no ROX!! 
   Servidor Dedicado sem Lag e Sério
   Pvp balançeado
   War System
   Varios Eventos Exclusivos
   para tirar as houses de players inativos 10 dias fale !eject (na frente da house)
  Mais Novidades entrem em nósso site          
Bom Jogo]]
}

  -- Fim de Configurações

  doBroadcastMessage(mensagens[math.random(1,table.maxn(mensagens))], cor)
return TRUE
end