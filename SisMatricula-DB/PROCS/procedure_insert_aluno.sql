-- inserção de novo aluno no banco de dados. Se a transação teve exito, retorna true, senão retorna false

-- Inserir novo Aluno
USE SisMatricula;
DROP PROCEDURE IF EXISTS procedure_insert_aluno;
DELIMITER $$
CREATE PROCEDURE procedure_insert_aluno(IN id varchar(20),                                        
                                        IN nome varchar(75),
                                        IN sen varchar(50),
                                        IN data_nas date,
                                        IN CPF bigint,
                                        IN ing date,
                                        IN em varchar(50),
                                        IN tel1 varchar(15),
                                        IN tel2 varchar(15))

BEGIN
  
  START TRANSACTION;
  INSERT INTO Usuario(identificacao, nomeUsuario, senha, dataNas, cpf, ingresso, 
                                    email, telefone1, telefone2, codTipoUsuario) VALUES
                      (id, nome, MD5(sen), data_nas, CPF, ing, em, tel1, tel2, 5);            
  
  IF (id = (select identificacao from Usuario ORDER BY codUsuario DESC LIMIT 1)) THEN
	COMMIT;
    SELECT true from dual;
  ELSE
    ROLLBACK;
    SELECT false from dual;
  END IF; 
     
END $$
                                             
DELIMITER ;       