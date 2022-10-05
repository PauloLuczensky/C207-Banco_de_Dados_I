create database if not exists hogwarts;
use hogwarts;
create table if not exists school(
idescola INT NOT NULL,
  nomeEscola VARCHAR(45) NULL,
  localizacao VARCHAR(45) NULL,
  anoFundacao DATE NULL,
  PRIMARY KEY (idescola)
);
CREATE TABLE IF NOT EXISTS Animal (
  idanimal INT NOT NULL,
  nomeAnimal VARCHAR(45) NULL,
  especie VARCHAR(45) NULL,
  PRIMARY KEY (idanimal));
  
  CREATE TABLE IF NOT EXISTS witch (
  idnome INT NOT NULL,
  nomeBruxo VARCHAR(45) NULL,
  casa VARCHAR(45) NULL,
  PRIMARY KEY (idnome));

#Create user
create user hermione identified by 'usuario1';
create user harry identified by 'usuario2';
create user hagrid identified by 'usuario3';

#Garantir acesso a eles (Grant)

#Garantir acesso de um usuario de nome hermione apenas para uso em qualquer banco de dados
grant usage on *.* to hermione;

#Dar todos os privilegios no banco de dados hogwarts para o usuário harry
grant all on hogwarts.* to harry;

#Retirar o privilegio do usuario hagrid de criar tabelas no banco de dados hogwarts
revoke create on hogwarts.* from hagrid;

#Permitir que o usuário harry possa adicionar e alterar dados da tabela Animal
# e dê privilegios a outros usuarios
grant insert, update, grant option on hogwarts.Animal to harry;

#Dando ao usuario hermione o poder de alterar nome e sobrenome da tabela witch
grant update(nome, sobrenome) on hogwarts.witch to hermione;

#Retirando todos os privilegios do meu usuário harry, inclusive de dar privilégios a outros usuarios
revoke all, grant option from  harry;

#Retirar os privilegios do hagrid de inserir e deletar bruxos da tabela witch
revoke insert, delete on hogwarts.witch from hagrid;
















