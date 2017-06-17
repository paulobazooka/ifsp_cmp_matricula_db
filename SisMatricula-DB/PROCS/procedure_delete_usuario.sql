-- procedure para excluir usuario 
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