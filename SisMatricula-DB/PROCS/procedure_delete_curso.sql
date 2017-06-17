-- deletar curso
USE SisMatricula;
DROP PROCEDURE IF EXISTS procedure_delete_curso;
DELIMITER $$
CREATE PROCEDURE procedure_delete_curso(IN cod int)

BEGIN
  
  START TRANSACTION;
  
  DELETE FROM Curso WHERE codCurso = cod; 
                                  
  IF ((select codCurso from Curso where codCurso = cod) is null) THEN      
 	  COMMIT;
      SELECT true from dual;
    
  ELSE
    ROLLBACK;
    SELECT false from dual;
  END IF; 
     
END $$
                                             
DELIMITER ;                     