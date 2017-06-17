-- Alterar Turma --
USE SisMatricula;
DROP PROCEDURE IF EXISTS procedure_update_turma;
DELIMITER $$
CREATE PROCEDURE procedure_update_turma(IN cod INT, 
                                        IN sigl VARCHAR(10), 
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
   
      START TRANSACTION;      
      UPDATE Turma SET siglaTurma = sigl, codCurso = codCur, codDisciplina = codDisc, anoTurma = anoT, 
             semestreTurma = semestre, codTurno = codTur, vagas = num_vagas
	    WHERE codTurma = cod;
      
      UPDATE Horario SET diaSemana = diaSema, horaInicio = horaIN, horaTermino = horaFIM
      WHERE codTurma = cod;
      
  IF (sigl = (select siglaTurma from Turma WHERE codTurma = cod)  AND
      codCur = (select codCurso from Turma WHERE codTurma = cod) AND
      anoT = (select anoTurma from Turma WHERE codTurma = cod) AND
      codTur = (select codTurno from Turma WHERE codTurma = cod) AND
      num_vagas = (select vagas from Turma WHERE codTurma = cod) AND
      diaSema = (select diaSemana from Horario WHERE codTurma = cod) AND
      horaIN = (select horaInicio from Horario WHERE codTurma = cod) AND
      horaFIM = (select horaTermino from Horario WHERE codTurma = cod)) THEN      
 	  COMMIT;
      SELECT true from dual;    
  ELSE
      ROLLBACK;
      SELECT false from dual;
  END IF; 
     
END $$                                             
DELIMITER ; 