create database if not exists aula2;
use aula2;

#Criando uma tabela
create table if not exists usuario(
id int not null auto_increment primary key,
nome varchar(50),
ano_nasc varchar(50),
pais varchar(50)
);

create table if not exists Cliente(
cpf varchar(50) primary key,
nome varchar(50),
idade int,
telefone varchar(50),
cidade varchar(50),
TotalCompra float
);

#Inserindo os dados
INSERT INTO usuario(nome,ano_nasc,pais) VALUES('Fulano','2002','Brasil');
INSERT INTO usuario(nome,ano_nasc,pais) VALUES('Beltrano','1934','França');
INSERT INTO usuario(nome,ano_nasc,pais) VALUES('Beto','2300','EUA');

SELECT * from usuario;

INSERT INTO Cliente(cpf,nome,idade,telefone,cidade,TotalCompra) VALUES('123456789','jOÃO LUCAS',24,'9845-6952','POUSO ALEGRE',145);
INSERT INTO Cliente(cpf,nome,idade,telefone,cidade,TotalCompra) VALUES('987654321','LUCAS',21,'9845-6951','BRASOPOLIS',150);
INSERT INTO Cliente(cpf,nome,idade,telefone,cidade,TotalCompra) VALUES('111111111','PEDRO',19,'9845-6943','ITAJUBA',0);
INSERT INTO Cliente(cpf,nome,idade,telefone,cidade,TotalCompra) VALUES('222222222','JOSE',29,'8845-6952','POUSO ALEGRE',80);

SELECT * FROM Cliente;

#Atualizar os dados
#UPDATE
UPDATE usuario SET nome = 'Pedro' WHERE id = 1;
UPDATE usuario SET ano_nasc = '1850' , pais = 'Uruguai' WHERE id = 2;
SELECT * FROM usuario;

#DELETANDO
#DELETE
DELETE FROM usuario WHERE id = 1;

#BUSCAS DOS DADOS
#SELECT
#Selecionando todas as colunas
SELECT * FROM usuario;
#Filtrando os dados
#Buscando os dados pelo nome do pais
SELECT nome,ano_nasc FROM usuario WHERE pais = 'Uruguai';

#Buscando os dados por operadores matematicos
SELECT nome,pais FROM usuario WHERE ano_nasc>=2000;
SELECT nome FROM usuario WHERE ano_nasc>1800 and not pais = 'Uruguai';

#Buscando dados pelas letras
SELECT * FROM Cliente WHERE nome like 'JO____%';
SELECT nome FROM Cliente WHERE nome like '%U%';

#selecionando cidades diferentes, não há repetição do mesmo nome
SELECT DISTINCT cidade FROM Cliente;

#Limitando a busca para 2
SELECT * FROM Cliente limit 2;

#Selecionando o maior valor
SELECT max(TotalCompra) FROM Cliente;

#Selecionando o menor valor
SELECT min(TotalCompra) FROM Cliente;

#Selecionando a média dos valores
SELECT avg(TotalCompra) FROM Cliente;

