-- Alterar Curso --
USE SisMatricula;
DROP PROCEDURE IF EXISTS procedure_update_disciplina;
DELIMITER $$
CREATE PROCEDURE procedure_update_disciplina(IN cod INT, IN nome VARCHAR(100), IN sigl VARCHAR(6), IN semest INT, IN horas INT, IN ement TEXT)
                                       
BEGIN
   
      START TRANSACTION;  
      UPDATE Disciplina SET nomeDisciplina = nome, siglaDisciplina = sigl, 
             semestre = semest, totalHoras = horas, ementa = ement
	  WHERE codDisciplina = cod;
  
  IF (nome = (select nomeDisciplina from Disciplina WHERE codDisciplina = cod)  AND
      sigl = (select siglaDisciplina from Disciplina WHERE codDisciplina = cod) AND
      semest = (select semestre from Disciplina WHERE codDisciplina = cod) AND
      horas = (select totalHoras from Disciplina WHERE codDisciplina = cod) AND
      ement = (select ementa from Disciplina WHERE codDisciplina = cod)) THEN      
 	  COMMIT;
      SELECT true from dual;    
  ELSE
      ROLLBACK;
      SELECT false from dual;
  END IF; 
     
END $$
                                             
DELIMITER ;