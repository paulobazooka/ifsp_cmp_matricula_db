-- Inserir novo Aluno
USE SisMatricula;
DROP PROCEDURE IF EXISTS procedure_insert_novo_aluno;
DELIMITER $$
CREATE PROCEDURE procedure_insert_novo_aluno(IN id varchar(20),
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




-- alterar aluno geral
USE SisMatricula;
DROP PROCEDURE IF EXISTS procedure_update_aluno;
DELIMITER $$
CREATE PROCEDURE procedure_update_aluno(IN cod int,										
									    IN nome varchar(75),										
										IN data_nas date,																		
										IN em varchar(50),
										IN tel1 varchar(15),
										IN tel2 varchar(15))

BEGIN
  
  START TRANSACTION;
  
  UPDATE Usuario SET nomeUsuario = nome, dataNas = data_nas, email = em,
                          telefone1 = tel1, telefone2 = tel2 WHERE codUsuario = cod; 
                                  
  IF (nome = (select nome from Usuario where codUsuario = cod) AND
	  data_nas = (select dataNas from Usuario where codUsuario = cod) AND
      em = (select email from Usuario where codUsuario = cod) AND
	  tel1 = (select telefone1 from Usuario where codUsuario = cod) AND
      tel2 = (select telefone2 from Usuario where codUsuario = cod))        THEN
      
	COMMIT;
    SELECT true from dual;
    
  ELSE
    ROLLBACK;
    SELECT false from dual;
  END IF; 
     
END $$
                                             
DELIMITER ;     



-- delete usuario geral
USE SisMatricula;
DROP PROCEDURE IF EXISTS procedure_delete_usuario;
DELIMITER $$
CREATE PROCEDURE procedure_delete_usuario(IN cod int)

BEGIN
  
  START TRANSACTION;
  
  DELETE FROM Usuario WHERE codUsuario = cod; 
                                  
  IF ((select codUsuario from Usuario where codUsuario = cod) is null) THEN      
 	  COMMIT;
      SELECT true from dual;
    
  ELSE
    ROLLBACK;
    SELECT false from dual;
  END IF; 
     
END $$
                                             
DELIMITER ;                                                                                             


call procedure_delete_usuario(56);