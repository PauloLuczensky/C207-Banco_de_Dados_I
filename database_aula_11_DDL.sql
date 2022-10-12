drop database if exists cinema;
create database if not exists cinema;
USE cinema;

create table if not exists filme(
id int not null auto_increment primary key,
titulo varchar(50) not null,
genero varchar(50) not null,
tempo int not null
);

create table if not exists ator(
id int not null,
nome varchar(50) not null,
dataNasc int,
idFilme int,
sexo varchar(50),
primary key(id),
constraint fk_ator_filme
     foreign key(idFilme)
     references filme(id)
     on delete cascade
);

select * from filme;
select * from ator;

#Alter
alter table ator add pais varchar(50) not null;
alter table ator add idioma varchar(50) not null;
alter table ator change dataNasc idade int not null;

alter table ator drop column sexo;

insert into filme(id, titulo,genero,tempo) values(1,'Jogos Vorazes','acao',143);

insert into ator(id,nome,idade,idFilme,pais,idioma) values(1,'Jennifer Lawrence',30,1,'Eua','ingles');

alter table ator change pais paisDeOrigem varchar(50) not null;
alter table ator drop column idade;

select * from ator;