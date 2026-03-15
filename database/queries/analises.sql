   *ANÁLISES GERAIS DO BANCO*

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



   *ANÁLISES DE JOGOS*

-- Lista de todos os jogos
SELECT *
FROM jogos;

-- Jogos ordenados alfabeticamente
SELECT nome
FROM jogos
ORDER BY nome;

-- Jogos mais recentes
SELECT nome, lancamento
FROM jogos
ORDER BY lancamento DESC;

-- Quantidade de jogos por plataforma
SELECT p.nome_plataforma, COUNT(j.id_jogo) AS total_jogos
FROM plataforma p
JOIN jogos j
ON j.plataforma_id = p.plataforma_id
GROUP BY p.nome_plataforma
ORDER BY total_jogos DESC;

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



   *ANÁLISE DE CATEGORIAS*


-- Lista de categorias
SELECT *
FROM categorias;

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



   *ANÁLISE DE USUÁRIOS*


-- Lista de usuários
SELECT *
FROM usuario;

-- Usuários ordenados por nome
SELECT nome
FROM usuario
ORDER BY nome;

-- Total de usuários por assinatura
SELECT a.assinatura_tipo, COUNT(u.usuario_id) AS total
FROM assinatura a
JOIN usuario u
ON a.assinatura_id = u.assinatura_id
GROUP BY a.assinatura_tipo;

-- Usuários com assinatura mensal
SELECT u.nome
FROM usuario u
JOIN assinatura a
ON u.assinatura_id = a.assinatura_id
WHERE a.assinatura_tipo = 'mensal';

-- Usuários com assinatura anual
SELECT u.nome
FROM usuario u
JOIN assinatura a
ON u.assinatura_id = a.assinatura_id
WHERE a.assinatura_tipo = 'anual';



   *ANÁLISE DE PAGAMENTOS*


     -- Lista de pagamentos
SELECT *
FROM pagamento;

-- Métodos de pagamento disponíveis
SELECT *
FROM metodo;

-- Pagamentos com seus métodos
SELECT p.pagamento_id, m.metodo_nome
FROM pagamento p
JOIN metodo m
ON p.metodo_id = m.metodo_id;

-- Quantidade de pagamentos por método
SELECT m.metodo_nome, COUNT(p.pagamento_id) AS total
FROM metodo m
JOIN pagamento p
ON m.metodo_id = p.metodo_id
GROUP BY m.metodo_nome;

-- Pagamentos ordenados por valor
SELECT *
FROM pagamento
ORDER BY valor DESC;



   *CONSULTAS ANÁLITICAS AVANÇADAS*


     -- Jogos com plataforma
SELECT j.nome AS jogo, p.nome_plataforma
FROM jogos j
JOIN plataforma p
ON j.plataforma_id = p.plataforma_id;

-- Jogos e categorias ordenados
SELECT j.nome, c.nome_categoria
FROM jogos j
JOIN jogos_categorias jc
ON j.id_jogo = jc.jogos_id
JOIN categorias c
ON jc.categoria_id = c.categoria_id
ORDER BY j.nome;

-- Quantidade total de relações jogo-categoria
SELECT COUNT(*) AS total_relacoes
FROM jogos_categorias;

-- Jogos que possuem categoria
SELECT DISTINCT j.nome
FROM jogos j
JOIN jogos_categorias jc
ON j.id_jogo = jc.jogos_id;

-- Categorias sem jogos
SELECT c.nome_categoria
FROM categorias c
LEFT JOIN jogos_categorias jc
ON c.categoria_id = jc.categoria_id
WHERE jc.jogos_id IS NULL;



*ANÁLISE DE IMPACTO*


-- Jogos por desenvolvedora
SELECT desenvolvedora, COUNT(*) AS total
FROM jogos
GROUP BY desenvolvedora
ORDER BY total DESC;

-- Jogos por ano
SELECT YEAR(lancamento) AS ano, COUNT(*) AS total
FROM jogos
GROUP BY ano;

