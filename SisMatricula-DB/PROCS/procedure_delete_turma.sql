-- Deletar Turma  
USE SisMatricula;
DROP PROCEDURE IF EXISTS procedure_delete_turma;
DELIMITER $$
CREATE PROCEDURE procedure_delete_turma(IN cod int)
BEGIN
  
  START TRANSACTION;  
  DELETE FROM Horario WHERE codTurma = cod;
  DELETE FROM Turma   WHERE codTurma = cod;  
                                  
  IF ((select codTurma from Turma where codTurma = cod) is null)THEN      
 	  COMMIT;
      SELECT true from dual;    
  ELSE
      ROLLBACK;
      SELECT false from dual;
  END IF; 
     
END $$                                             
DELIMITER ;    