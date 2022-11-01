DROP DATABASE IF EXISTS loja;
CREATE DATABASE loja;
USE loja;
SET GLOBAL log_bin_trust_function_creators = 1;
CREATE TABLE compra(
id int not null auto_increment primary key,
preco float,
pagamento float
);
INSERT INTO compra VALUES (id,9.5,10.25);
INSERT INTO compra VALUES (id,18.99,25);
INSERT INTO compra VALUES (id,3.99,5);
INSERT INTO compra VALUES (id,8.85,8.89);
INSERT INTO compra VALUES (id,19.49,20);

DELIMITER $$
DROP FUNCTION IF EXISTS CAIXA $$
CREATE FUNCTION TROCO (ppreco DOUBLE, ppagamento DOUBLE)
RETURNS VARCHAR(20)
deterministic 
BEGIN
  DECLARE SITUACAO VARCHAR(20);
  DECLARE CHANGES DOUBLE;
  SET CHANGES = (ppagamento-ppreco);
  IF CHANGES <= 0.05 THEN
     SET SITUACAO = 'NÃO TEM TROCO';
  ELSEIF CHANGES <=1 THEN
     SET SITUACAO = 'BALINHAS';
  ELSE
     SET SITUACAO = 'DINHEIRO';
   END IF;
   RETURN(SITUACAO);
END$$
DELIMITER ;

select id,preco,pagamento, troco(preco, pagamento) as 'Troco' from compra;
