function onThink(interval, lastExecution)
  -- Configurações
    local cor = 22 -- Defina a cor da mensagem (22 = branco)
    local mensagens ={
[[Baiak Cartoon Irforma.
      Quér comprar as melhóres armas? entrem em nósso site
      Captura bandeira: Em Manutenção
      Blood Castle: 3 em 3 hóras
      City War: Sabados e Domingos 16:00
      Battle Field: Todos os dias as 15:00 hóras, 30 jogadores no máximo
      Dodge system !dodge
      Critical System !critical. OBS:Critical Só funciona vai funcionar quando atk players, em monsters não!
      Cast system /castinfo
      VIP 2 :fale !vip2 e use o item, custo de 5kk
      Ateciosamente Equipe ROX ! 
Bom Jogo]]
}

  -- Fim de Configurações

  doBroadcastMessage(mensagens[math.random(1,table.maxn(mensagens))], cor)
return TRUE
end