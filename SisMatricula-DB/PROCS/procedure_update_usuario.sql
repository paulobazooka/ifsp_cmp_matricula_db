-- procedure para alterar usuario corrente logado no sistema (java)
USE SisMatricula;
DROP PROCEDURE IF EXISTS procedure_update_usuario;
DELIMITER $$
CREATE PROCEDURE procedure_update_usuario(IN cod int,										
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