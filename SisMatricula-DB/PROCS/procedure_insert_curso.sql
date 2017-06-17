-- Inserir novo curso
USE SisMatricula;
DROP PROCEDURE IF EXISTS procedure_insert_curso;
DELIMITER $$
CREATE PROCEDURE procedure_insert_curso(IN nome VARCHAR(100), 
									                      IN sigl VARCHAR(10), 
										                    IN dtcriacao DATE,
                                        IN descr TEXT)

BEGIN
   
      START TRANSACTION;  
  INSERT INTO Curso (nomeCurso, siglaCurso, dtCurso, descricao) VALUES
                    (nome, sigl, dtcriacao, descr);  
                                  
  IF (nome = (select nomeCurso from Curso ORDER BY codCurso DESC LIMIT 1)) THEN      
 	  COMMIT;
      SELECT true from dual;
    
  ELSE
      ROLLBACK;
    SELECT false from dual;
  END IF; 
     
END $$
                                             
DELIMITER ; 
