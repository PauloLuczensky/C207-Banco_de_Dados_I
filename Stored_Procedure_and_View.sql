DROP DATABASE IF EXISTS aula_procedure;
CREATE DATABASE aula_procedure;
USE aula_procedure;
CREATE TABLE Aluno(   
   id int not null auto_increment primary key,    
   nome varchar(50),    
   idade int,    
   email varchar(100)
);

set @idadeTotal = 0;

DELIMITER $$
DROP PROCEDURE IF EXISTS cadaluno $$
create procedure cadaluno(in nome varchar(50), in idade int, in email varchar(50))
begin
insert into aluno(nome, idade, email) values(nome,idade,email);
if idade > 10
THEN SET @idadeTotal = @idadeTotal + idade;
END IF;
end $$
delimiter ;

call cadaluno('bart',18,'bart@email.com.br');

call cadaluno('bartolomeu',20,'bart@email.com.br');

select * from aluno;
SELECT @idadeTotal;

DROP VIEW IF EXISTS cadaluno;
CREATE VIEW cadaluno AS (SELECT nome, idade, email, estado
      FROM Aluno
      );
select * from cadaluno;
