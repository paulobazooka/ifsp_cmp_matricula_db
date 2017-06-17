-- criar disciplina
USE SisMatricula;
DROP PROCEDURE IF EXISTS procedure_inserir_disciplina;
DELIMITER $$
CREATE PROCEDURE procedure_inserir_disciplina(IN nome VARCHAR(100), IN sigla VARCHAR(6), IN semest INT, IN horas INT, IN ement TEXT)
BEGIN
     
     START TRANSACTION;
     INSERT INTO Disciplina (nomeDisciplina, 
							 semestre,						                    						
							 siglaDisciplina,                        
							 totalHoras,
							 ementa) VALUES                             
                             (nome, semest, sigla, horas, ement);
                                  
  IF (nome = (select nomeDisciplina from Disciplina ORDER BY codDisciplina DESC LIMIT 1)) THEN      
 	  COMMIT;
      SELECT true from dual;    
  ELSE
      ROLLBACK;
      SELECT false from dual;
  END IF; 

END $$
DELIMITER ;
