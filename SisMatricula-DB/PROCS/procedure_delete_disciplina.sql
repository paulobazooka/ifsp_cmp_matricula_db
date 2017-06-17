-- Deletar Disciplina
USE SisMatricula;
DROP PROCEDURE IF EXISTS procedure_delete_disciplina;
DELIMITER $$
CREATE PROCEDURE procedure_delete_disciplina(IN cod int)
BEGIN
  
  START TRANSACTION;  
  DELETE FROM Disciplina WHERE codDisciplina = cod; 
                                  
  IF ((select codDisciplina from Disciplina where codDisciplina = cod) is null) THEN      
 	  COMMIT;
      SELECT true from dual;    
  ELSE
      ROLLBACK;
      SELECT false from dual;
  END IF; 
     
END $$                                             
DELIMITER ;   
