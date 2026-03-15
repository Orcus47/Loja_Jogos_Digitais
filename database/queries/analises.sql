-- Jogos por desenvolvedora
SELECT desenvolvedora, COUNT(*) AS total
FROM jogos
GROUP BY desenvolvedora
ORDER BY total DESC;

-- Jogos por ano
SELECT YEAR(lancamento) AS ano, COUNT(*) AS total
FROM jogos
GROUP BY ano;

-- Jogos mais recentes
SELECT nome, lancamento
FROM jogos
ORDER BY lancamento DESC
LIMIT 10;

-- Total de usuários cadastrados
SELECT COUNT(*) AS total_usuarios
FROM usuario;

-- Total de jogos cadastrados
SELECT COUNT(*) AS total_jogos
FROM jogos;

-- Total de categorias disponíveis
SELECT COUNT(*) AS total_categorias
FROM categorias;

-- Total de plataformas
SELECT COUNT(*) AS total_plataformas
FROM plataforma;

-- Total de métodos de pagamento
SELECT COUNT(*) AS total_metodos_pagamento
FROM metodo;

-- Quantidade de jogos por plataforma
SELECT p.nome_plataforma, COUNT(j.id_jogo) AS total_jogos
FROM plataforma p
JOIN jogos j
ON j.plataforma_id = p.plataforma_id
GROUP BY p.nome_plataforma
ORDER BY total_jogos DESC;

-- Jogos mais recentes
SELECT nome, lancamento
FROM jogos
ORDER BY lancamento DESC;

-- Jogos de uma plataforma específica
SELECT j.nome
FROM jogos j
JOIN plataforma p
ON j.plataforma_id = p.plataforma_id
WHERE p.nome_plataforma = 'PC';

-- Quantidade de jogos por categoria
SELECT c.nome_categoria, COUNT(jc.jogos_id) AS total_jogos
FROM categorias c
JOIN jogos_categorias jc
ON c.categoria_id = jc.categoria_id
GROUP BY c.nome_categoria
ORDER BY total_jogos DESC;

-- Jogos com suas categorias
SELECT j.nome AS jogo, c.nome_categoria
FROM jogos j
JOIN jogos_categorias jc
ON j.id_jogo = jc.jogos_id
JOIN categorias c
ON jc.categoria_id = c.categoria_id;

-- Categorias com mais de 3 jogos
SELECT c.nome_categoria, COUNT(jc.jogos_id) AS total
FROM categorias c
JOIN jogos_categorias jc
ON c.categoria_id = jc.categoria_id
GROUP BY c.nome_categoria
HAVING total > 3;

-- Categorias ordenadas alfabeticamente
SELECT nome_categoria
FROM categorias
ORDER BY nome_categoria;
