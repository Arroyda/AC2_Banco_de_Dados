# Mostra uma lista com o código de cada filme que já foi alugado e a quantidade de vezes que foi alugado.
SELECT f.cod_filme, f.filme, COUNT(l.cod_locacao) AS quantidade_alugueis FROM filme f
JOIN locacao l ON f.cod_filme = l.cod_filme
GROUP BY f.cod_filme, f.filme ORDER BY quantidade_alugueis DESC;

# Mostra o nome e a data de devolução de todos os filmes de Ação cujo diretor seja RichardDonner
# que foram alugados pelo cliente Abimael Silva.
SELECT f.filme, l.data_devolucao FROM filme f
JOIN locacao l ON f.cod_filme = l.cod_filme 
JOIN cliente c ON l.cod_cliente = c.cod_cliente
JOIN categoria cat ON f.cod_categoria = cat.cod_categoria
WHERE cat.nome_categoria = 'Ação' AND f.diretor = 'Richard Donner' AND c.nome = 'Abimael Silva';

# Mostra o nome do filme, seu valor de locação, um campo chamado desconto onde deve aparecer 
# o valor de 10% de desconto em cima do valor de locação e um campo chamado valor_final que deve
# possuir valor de locação menos os dez por cento de desconto dado.
SELECT 
    f.filme AS nome_filme,
    f.valor_locacao AS valor_locacao,
    f.valor_locacao * 0.10 AS desconto,
    f.valor_locacao - (f.valor_locacao * 0.10) AS valor_final
FROM filme f;

# Mostra sem repetição de registros, todos os filmes alugados por clientes da cidade de Votorantim
SELECT DISTINCT f.filme FROM filme f
JOIN locacao l ON f.cod_filme = l.cod_filme
JOIN cliente c ON l.cod_cliente = c.cod_cliente
WHERE c.cidade = 'Votorantim';

# Mostra qual o último filme alugado
SELECT f.filme, l.data_retirada FROM filme f
JOIN locacao l ON f.cod_filme = l.cod_filme
ORDER BY l.data_retirada DESC
LIMIT 1;

# Mostra quanto à locadora lucrou com as locações do filme “A vida é bela”
SELECT SUM(f.valor_locacao) AS lucro_total FROM filme f
JOIN locacao l ON f.cod_filme = l.cod_filme WHERE f.filme = 'A vida é bela';

# Mostra a quantidade de saídas de filmes para locação agrupando a consulta pordiretor
SELECT f.diretor, COUNT(l.cod_locacao) AS quantidade_locacoes FROM filme f
LEFT JOIN locacao l ON f.cod_filme = l.cod_filme
GROUP BY f.diretor ORDER BY quantidade_locacoes DESC;

#  Mostra todas as categorias dos filmes alugados pela cliente MariaChiquinha.
SELECT DISTINCT cat.nome_categoria FROM categoria cat
JOIN filme f ON cat.cod_categoria = f.cod_categoria
JOIN locacao l ON f.cod_filme = l.cod_filme
JOIN cliente c ON l.cod_cliente = c.cod_cliente
WHERE c.nome = 'Maria Chiquinha';

# Mostra o nome e o telefone de todos os clientes que já alugaram o filmeConstantine.
SELECT c.nome, c.telefone FROM cliente c
JOIN locacao l ON c.cod_cliente = l.cod_cliente
JOIN filme f ON l.cod_filme = f.cod_filme
WHERE f.filme = 'Constantine';

# Mostra todas as categorias de filmes que não possuem filmes cadastrado.
SELECT cat.nome_categoria FROM categoria cat
LEFT JOIN filme f ON cat.cod_categoria = f.cod_categoria
WHERE f.cod_filme IS NULL;




