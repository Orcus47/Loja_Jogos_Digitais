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
