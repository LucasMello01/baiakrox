function onThink(interval, lastExecution)
  -- Configura��es
    local cor = 22 -- Defina a cor da mensagem (22 = branco)
    local mensagens ={
[[Baiak Cartoon Irforma.
      Qu�r comprar as melh�res armas? entrem em n�sso site
      Captura bandeira: Em Manuten��o
      Blood Castle: 3 em 3 h�ras
      City War: Sabados e Domingos 16:00
      Battle Field: Todos os dias as 15:00 h�ras, 30 jogadores no m�ximo
      Dodge system !dodge
      Critical System !critical. OBS:Critical S� funciona vai funcionar quando atk players, em monsters n�o!
      Cast system /castinfo
      VIP 2 :fale !vip2 e use o item, custo de 5kk
      Ateciosamente Equipe ROX ! 
Bom Jogo]]
}

  -- Fim de Configura��es

  doBroadcastMessage(mensagens[math.random(1,table.maxn(mensagens))], cor)
return TRUE
end