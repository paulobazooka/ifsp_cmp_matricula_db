-- Alterar Curso --
USE SisMatricula;
DROP PROCEDURE IF EXISTS procedure_update_curso;
DELIMITER $$
CREATE PROCEDURE procedure_update_curso(IN cod INT,
                                        IN nome VARCHAR(100), 
									    IN sigl VARCHAR(10), 
										IN dtcriacao DATE,
                                        IN descr TEXT)

BEGIN
   
      START TRANSACTION;  
  UPDATE Curso SET nomeCurso = nome, siglaCurso = sigl, dtCurso = dtcriacao, descricao = descricao
               WHERE codCurso = cod;
  
  IF (nome = (select nomeCurso from Curso WHERE codCurso = cod)  AND
      sigl = (select siglaCurso from Curso WHERE codCurso = cod) AND
      dtcriacao = (select dtCurso from Curso WHERE codCurso = cod) AND
      descr = (select descricao from Curso WHERE codCurso = cod)) THEN      
 	  COMMIT;
      SELECT true from dual;
    
  ELSE
      ROLLBACK;
    SELECT false from dual;
  END IF; 
     
END $$
                                             
DELIMITER ;