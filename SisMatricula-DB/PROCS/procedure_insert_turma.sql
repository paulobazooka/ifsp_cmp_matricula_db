-- Criar Turma 
USE SisMatricula;
DROP PROCEDURE IF EXISTS procedure_insert_turma;
DELIMITER $$
CREATE PROCEDURE procedure_insert_turma(IN sigl VARCHAR(10), 
										                    IN codCur INT, 
                                        IN codDisc INT,
										                    IN anoT INT,
                                        IN semestre INT,
                                        IN codTur INT,
                                        IN num_vagas INT,
									                      IN diaSema VARCHAR(20),
                                        IN horaIN time,
                                        IN horaFIM time)

BEGIN
DECLARE codigo_turma INT;
   
      START TRANSACTION;  
  INSERT INTO Turma (siglaTurma, codCurso, codDisciplina, anoTurma, semestreTurma, codTurno, 
                     vagas, matriculasRealizadas, turmaEncerrada, aberto) VALUES
                    (sigl, codCur, codDisc, anoT, semestre, codTur, num_vagas, 0, false, true); 

  
  SET codigo_turma = (select codTurma from Turma ORDER BY codTurma DESC LIMIT 1);
  
  INSERT INTO Horario(codTurma, diaSemana, horaInicio, horaTermino) VALUES 
                     (codigo_turma, diaSema, horaIN, horaFIM);                   
                                  
  IF (sigl = (select siglaTurma from Turma ORDER BY codTurma DESC LIMIT 1)) THEN      
 	  COMMIT;
      SELECT true from dual;    
  ELSE
      ROLLBACK;
      SELECT false from dual;
  END IF; 
     
END $$
DELIMITER ;