function onThink(interval, lastExecution)
  -- Configura��es
    local cor = 22 -- Defina a cor da mensagem (22 = branco)
    local mensagens ={
[[Voce Esta jogando no ROX!! 
   Servidor Dedicado sem Lag e S�rio
   Pvp balan�eado
   War System
   Varios Eventos Exclusivos
   para tirar as houses de players inativos 10 dias fale !eject (na frente da house)
  Mais Novidades entrem em n�sso site          
Bom Jogo]]
}

  -- Fim de Configura��es

  doBroadcastMessage(mensagens[math.random(1,table.maxn(mensagens))], cor)
return TRUE
end