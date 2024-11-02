# Realizar a inserção de um novo cliente
INSERT INTO cliente (rg, nome, endereco, bairro, cidade, estado, telefone, email, datanascimento, sexo)
VALUES ('221232348', 'Dino da Silva Sauro', 'Rua Joaquim Silveira, 34', 'Jd. Romano', 'São Roque', 'SP', NULL, NULL, NULL, 'M');

# O Cliente Dino realizou a locação de 2 filmes no dia de hoje
INSERT INTO locacao (cod_cliente, cod_filme, data_retirada, data_devolucao)
VALUES 
(1, 1, NOW(), NULL),  -- Locação do filme Amadeus
(1, 2, NOW(), NULL);  -- Locação do filme ConstantineX

# Inserção do Filme 
INSERT INTO filme (filme, cod_categoria, diretor, valor_locacao, reservada)
VALUES ('Missão Impossível 3', 1, 'J.J. Abrams', 7.00, 'N');
# Registro da Locação 
INSERT INTO locacao (cod_cliente, cod_filme, data_retirada, data_devolucao)
VALUES 
(1, 1, NOW(), NULL),  -- Amadeus
(1, 2, NOW(), NULL),  -- Constantine
(1, 3, NOW(), NULL);  -- Missão Impossível 3

# Altera o Modo Seguro
SET SQL_SAFE_UPDATES = 0;
# Atualiza o nome da categoria “Desenho” para “Animação”
UPDATE categoria SET nome_categoria = 'Animação' WHERE nome_categoria = 'Desenho';

# Um cliente ligou e pediu para deixar reservado todos os filmes do diretor “Terry Gilliam”, realizar essa atualização.
UPDATE filme SET reservada = 'S' WHERE diretor = 'Terry Gilliam';	

# O cliente “Rafael Nunes Sales” mudou para a Rua Guilherme Orlando, 333 no 
# jardim Santa Rosália e seu novo telefone é 1532145543, realizar as alterações no
# seu registro
UPDATE cliente 
SET endereco = 'Rua Guilherme Orlando, 333',
    bairro = 'Jardim Santa Rosália',
    telefone = '1532145543'
WHERE nome = 'Rafael Nunes Sales';

# Atualizar o nome de todas as categoria de filmes deixando-as com todas as letras maiúsculas.
UPDATE categoria SET nome_categoria = UPPER(nome_categoria);

# Realizar um reajuste no valor de do filme para 50% no valor atual para os filmes “A Mexicana”, “A Verdade Nua e Crua” e “Austrália”.
UPDATE filme SET valor_locacao = valor_locacao * 0.5 WHERE filme IN ('A Mexicana', 'A Verdade Nua e Crua', 'Austrália');	

# Excluir todas as categorias de filmes que não possuem filmes cadastrados
DELETE FROM categoria
WHERE cod_categoria NOT IN (
    SELECT cod_categoria
    FROM filme
);

# Inserir o seu registro na tabela de clientes.
INSERT INTO cliente (rg, nome, endereco, bairro, cidade, estado, telefone, email, datanascimento, sexo)
VALUES ('999999999', 'Vitor Assunção Arruda', 'Rua Florival Candido 190', 'WanelVilleV', 'Sorocaba', 'SP', '14997671364', 
'varruda170@gmail.com','2005-08-15 00:00:00.000', 'M');



