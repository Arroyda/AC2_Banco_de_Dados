create database videolocadora;

use videolocadora;

#CRIAÇÃO DAS TABELAS

create table cliente
(
	cod_cliente int auto_increment primary key not null,
	rg varchar(9) not null,
	nome varchar(50) not null,
	endereco varchar(50) null,
	bairro varchar(30) null,
	cidade varchar(30) null, 
	estado char(2) not null,
	telefone varchar(15) null,
	email varchar(30) null,
	datanascimento datetime null,
	sexo char(1)
);

create table categoria
(
	cod_categoria int auto_increment primary key not null,
	nome_categoria varchar(20) not null
);

create table filme
(
	cod_filme int auto_increment primary key not null,
	filme varchar(30) not null,
	cod_categoria int not null,
	diretor varchar(50) not null,
	valor_locacao float not null,
	reservada char(1) not null
);

create table locacao
(
	cod_locacao int auto_increment not null,
	cod_cliente int not null,
	cod_filme int not null,
	data_retirada datetime not null,
	data_devolucao datetime null,
	constraint pk_locacao_cliente primary key(cod_locacao, cod_cliente, cod_filme)
);


#CRIAÇÃO DOS RELACIONAMENTOS 
#LOCACAO - CLIENTES
alter table locacao add constraint fk_locacoes_cliente foreign key (cod_cliente) references cliente(cod_cliente);

#LOCACOES - FILME
alter table locacao add constraint fk_locacoes_filme foreign key (cod_filme) references filme(cod_filme);

#FILME - CATEGORIA
alter table filme add constraint fk_categoria_filme foreign key (cod_categoria) references categoria(cod_categoria);

#INSERÇÕES NAS TABELAS

#categoria
INSERT INTO categoria(nome_categoria) VALUES ('Ação');
INSERT INTO categoria(nome_categoria) VALUES ('Romance');
INSERT INTO categoria(nome_categoria) VALUES ('Aventura');
INSERT INTO categoria(nome_categoria) VALUES ('Ficção');
INSERT INTO categoria(nome_categoria) VALUES ('Drama');
INSERT INTO categoria(nome_categoria) VALUES ('Terror');
INSERT INTO categoria(nome_categoria) VALUES ('Desenho');
INSERT INTO categoria(nome_categoria) VALUES ('Policial');
INSERT INTO categoria(nome_categoria) VALUES ('Comédia');

#clientes
INSERT INTO cliente(rg,nome,endereco,bairro,cidade,estado,telefone,email,datanascimento,sexo) VALUES ('321346530', 'Abimael Silva', 'Rua Valmir, 1', 'Jd. Wanel Ville Cruz', 'Sorocaba', 'SP', '32125809', 'abimael.oliveira@facens.br', '1982-12-27 00:00:00.000', 'M');
INSERT INTO cliente(rg,nome,endereco,bairro,cidade,estado,telefone,email,datanascimento,sexo) VALUES ('421346111', 'Rafael Fernando de Moraes Moreno', 'Rua Francisco de Souza, 123', 'Jd. Nova Esperança', 'São Roque', 'SP', '32274567', 'rafael@terra.com.br', '1985-04-01 00:00:00.000', 'M');
INSERT INTO cliente(rg,nome,endereco,bairro,cidade,estado,telefone,email,datanascimento,sexo) VALUES ('324857670', 'João da Silva', 'Rua Mario Quintana, 13', 'Av. Bartolomeu', 'Sorocaba', 'SP', '32134098', 'joao@uol.com.br', '1992-12-05 00:00:00.000', 'M');
INSERT INTO cliente(rg,nome,endereco,bairro,cidade,estado,telefone,email,datanascimento,sexo) VALUES ('112345553', 'Maria Chiquinha', 'Rua Padre Luiz, 55', 'Jd. Vera Cruz', 'Sorocaba', 'SP', '23336684', 'maria@ig.com.br', '1982-11-30 00:00:00.000', 'F');
INSERT INTO cliente(rg,nome,endereco,bairro,cidade,estado,telefone,email,datanascimento,sexo) VALUES ('945848768', 'Rafael Nunes Sales', 'Rua Orlando Alvarenga, 4', 'Jd. Vera Cruz', 'Sorocaba', 'SP', '32124609', 'rafael.sales@terra.com.br', '1985-04-01 00:00:00.000', 'M');
INSERT INTO cliente(rg,nome,endereco,bairro,cidade,estado,telefone,email,datanascimento,sexo) VALUES ('676548499', 'Daniela Martin Feitosa', 'Rua Guilherme Oliveria, 1', 'Jd. Vera das Acássicas', 'Votorantim', 'SP', '32132109', 'daniela.martin@gmail.com', '1986-12-26 00:00:00.000', 'F');
INSERT INTO cliente(rg,nome,endereco,bairro,cidade,estado,telefone,email,datanascimento,sexo) VALUES ('321349999', 'Renata Cristina', 'Rua Orlando Alvarenga, 1', 'Jd. Vera Cruz', 'Sorocaba', 'SP', '32125809', 'renata@gmail', '1970-09-01 00:00:00.000', 'F');
INSERT INTO cliente(rg,nome,endereco,bairro,cidade,estado,telefone,email,datanascimento,sexo) VALUES ('335466531', 'Joaquim Ferreira de Souza Junior', 'Rua Outubro Vermelho, 65', 'Jd. Santa Rosália', 'Votorantim', 'SP', '11125809', 'joaquim_junior@ig.com.br', '1980-04-08 00:00:00.000', 'M');
INSERT INTO cliente(rg,nome,endereco,bairro,cidade,estado,telefone,email,datanascimento,sexo) VALUES ('112233445', 'Ladislau Ferreira', 'Rua Orlando Alvarenga, 12345', 'Jd. Vera Cruz', 'Sorocaba', 'SP', '32144409', 'ladislau@terra.com.br', '1988-01-03 00:00:00.000', 'M');
INSERT INTO cliente(rg,nome,endereco,bairro,cidade,estado,telefone,email,datanascimento,sexo) VALUES ('222222222', 'Vanessa Oliveira', 'Rua das Flores, 1', 'Jd. do Sol', 'Votorantim', 'SP', '32122222', 'vanessa@ig.com.br', '1998-08-08 00:00:00.000', 'F');

#filmes
INSERT INTO filme(filme,cod_categoria,diretor,valor_locacao,reservada) VALUES ('300', 1, 'Richard Donner', 3.5, 'n');
INSERT INTO filme(filme,cod_categoria,diretor,valor_locacao,reservada) VALUES ('Máquina Mortífera', 1, 'Richard Donner', 3.6, 'n');
INSERT INTO filme(filme,cod_categoria,diretor,valor_locacao,reservada) VALUES ('A Mexicana', 2, 'Burr Steers', 2, 's');
INSERT INTO filme(filme,cod_categoria,diretor,valor_locacao,reservada) VALUES ('A Verdade Nua e Crua', 2, 'Robert Luketic', 4, 'n');
INSERT INTO filme(filme,cod_categoria,diretor,valor_locacao,reservada) VALUES ('A vida é bela', 2, 'Roberto Benigni', 3.5, 's');
INSERT INTO filme(filme,cod_categoria,diretor,valor_locacao,reservada) VALUES ('Austrália', 3, 'Baz Luhrmann', 4, 's');
INSERT INTO filme(filme,cod_categoria,diretor,valor_locacao,reservada) VALUES ('Ultimato Bourn', 3, 'Paul Greengrass', 3.5, 'n');
INSERT INTO filme(filme,cod_categoria,diretor,valor_locacao,reservada) VALUES ('Constantine', 4, 'Francis Lawrence', 2.5, 's');
INSERT INTO filme(filme,cod_categoria,diretor,valor_locacao,reservada) VALUES ('Os Irmãos Grimm', 4, 'Terry Gilliam', 3.5, 'n');
INSERT INTO filme(filme,cod_categoria,diretor,valor_locacao,reservada) VALUES ('Os Doze Macacos', 4, 'Terry Gilliam', 2.5, 'n');
INSERT INTO filme(filme,cod_categoria,diretor,valor_locacao,reservada) VALUES ('Amadeus', 5, 'Milos Forman', 10, 'n');
INSERT INTO filme(filme,cod_categoria,diretor,valor_locacao,reservada) VALUES ('As Torres Gêmeas', 5, 'Oliver Stone', 2.5, 's');
INSERT INTO filme(filme,cod_categoria,diretor,valor_locacao,reservada) VALUES ('Platoon', 1, 'Oliver Stone', 5.5, 's');
INSERT INTO filme(filme,cod_categoria,diretor,valor_locacao,reservada) VALUES ('O Advogado do Diabo', 6, 'Taylor Hackford', 1.5, 's');
INSERT INTO filme(filme,cod_categoria,diretor,valor_locacao,reservada) VALUES ('Beowulf', 7, 'Robert Zemeckis', 1, 'n');
INSERT INTO filme(filme,cod_categoria,diretor,valor_locacao,reservada) VALUES ('Bolt o super cão', 7, 'Byron Howard', 1.5, 's');
INSERT INTO filme(filme,cod_categoria,diretor,valor_locacao,reservada) VALUES ('Apertem o cinto o piloto sumiu', 9, 'Jim Abrahams', 3.6, 's');
INSERT INTO filme(filme,cod_categoria,diretor,valor_locacao,reservada) VALUES ('Doze é demais', 9, 'Shawn Levy', 9.2, 's');
INSERT INTO filme(filme,cod_categoria,diretor,valor_locacao,reservada) VALUES ('Uma noite no museu', 9, 'Shawn Levy', 2.5, 'n');

#Locações
INSERT INTO locacao(cod_cliente,cod_filme,data_retirada,data_devolucao) VALUES (1,1, '2010-03-20 19:05:43.887', '2010-03-23 00:00:00.000');
INSERT INTO locacao(cod_cliente,cod_filme,data_retirada,data_devolucao) VALUES (1,6, '2010-03-20 19:05:43.887', '2010-03-23 00:00:00.000');
INSERT INTO locacao(cod_cliente,cod_filme,data_retirada,data_devolucao) VALUES (1,8, '2010-03-20 19:05:43.887', '2010-03-23 00:00:00.000');
INSERT INTO locacao(cod_cliente,cod_filme,data_retirada,data_devolucao) VALUES (1,2, '2010-03-15 00:00:00.000', '2010-03-17 00:00:00.000');
INSERT INTO locacao(cod_cliente,cod_filme,data_retirada,data_devolucao) VALUES (1,13, '2010-03-15 00:00:00.000', '2010-03-17 00:00:00.000');
INSERT INTO locacao(cod_cliente,cod_filme,data_retirada,data_devolucao) VALUES (2,5, '2010-03-20 19:05:43.887', '2010-03-21 00:00:00.000');
INSERT INTO locacao(cod_cliente,cod_filme,data_retirada,data_devolucao) VALUES (3,3, '2010-03-18 19:05:43.887', '2010-03-20 00:00:00.000');
INSERT INTO locacao(cod_cliente,cod_filme,data_retirada,data_devolucao) VALUES (3,19, '2010-03-18 19:05:43.887', '2010-03-20 00:00:00.000');
INSERT INTO locacao(cod_cliente,cod_filme,data_retirada,data_devolucao) VALUES (4,17, '2010-03-01 19:05:43.887', '2010-03-03 00:00:00.000');
INSERT INTO locacao(cod_cliente,cod_filme,data_retirada,data_devolucao) VALUES (5,5, '2010-03-03 19:05:43.887', '2010-03-05 00:00:00.000');
INSERT INTO locacao(cod_cliente,cod_filme,data_retirada,data_devolucao) VALUES (6,7, '2010-03-03 19:05:43.887', '2010-03-04 00:00:00.000');
INSERT INTO locacao(cod_cliente,cod_filme,data_retirada,data_devolucao) VALUES (6,9, '2010-03-03 19:05:43.887', '2010-03-04 00:00:00.000');
INSERT INTO locacao(cod_cliente,cod_filme,data_retirada,data_devolucao) VALUES (7,16, '2010-03-13 19:05:43.887', '2010-03-15 00:00:00.000');
INSERT INTO locacao(cod_cliente,cod_filme,data_retirada,data_devolucao) VALUES (7,1, '2010-03-13 19:05:43.887', '2010-03-15 00:00:00.000');
INSERT INTO locacao(cod_cliente,cod_filme,data_retirada,data_devolucao) VALUES (7,5, '2010-03-14 19:05:43.887', '2010-03-16 00:00:00.000');
INSERT INTO locacao(cod_cliente,cod_filme,data_retirada,data_devolucao) VALUES (7,8, '2010-03-14 19:05:43.887', '2010-03-16 00:00:00.000');
INSERT INTO locacao(cod_cliente,cod_filme,data_retirada,data_devolucao) VALUES (7,11, '2010-03-14 19:05:43.887', '2010-03-16 00:00:00.000');
INSERT INTO locacao(cod_cliente,cod_filme,data_retirada,data_devolucao) VALUES (7,12, '2010-03-15 19:05:43.887', '2010-03-17 00:00:00.000');
INSERT INTO locacao(cod_cliente,cod_filme,data_retirada,data_devolucao) VALUES (8,9, '2010-03-20 19:05:43.887', '2010-03-21 00:00:00.000');
INSERT INTO locacao(cod_cliente,cod_filme,data_retirada,data_devolucao) VALUES (9,3, '2010-03-21 19:05:43.887', '2010-03-22 00:00:00.000');
INSERT INTO locacao(cod_cliente,cod_filme,data_retirada,data_devolucao) VALUES (9,6, '2010-03-21 19:05:43.887', '2010-03-22 00:00:00.000');
INSERT INTO locacao(cod_cliente,cod_filme,data_retirada,data_devolucao) VALUES (10,10, '2010-02-20 19:05:43.887', '2010-02-21 00:00:00.000');
