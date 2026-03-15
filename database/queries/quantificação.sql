-- Quantidade de jogos por plataforma
SELECT p.nome_plataforma, COUNT(j.id_jogo) AS total_jogos
FROM jogos j
JOIN plataforma p ON j.plataforma_id = p.plataforma_id
GROUP BY p.nome_plataforma
ORDER BY total_jogos DESC;
