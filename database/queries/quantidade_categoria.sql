SELECT c.nome_categoria, COUNT(jc.jogos_id) AS total_jogos
FROM categorias c
JOIN jogos_categorias jc 
ON c.categoria_id = jc.categoria_id
GROUP BY c.nome_categoria
ORDER BY total_jogos DESC;
