USE SisMatricula;
SELECT "USE SisMatricula;" as '-- SELECT DATABASE';

SELECT "DELETE FROM Curso;" as '-- DELETE ALL RECORDS ON Curso';
SELECT CONCAT('INSERT INTO Curso VALUES (', nomeCurso,', ', 
											siglaCurso, ', ', 
                                            dtCurso, ', ', 
                                            descricao, ');') as '-- INSERT ON Curso' FROM Curso;


SELECT "DELETE FROM Disciplina;" as '-- DELETE ALL RECORDS ON Disciplina';
SELECT CONCAT('INSERT INTO Disciplina VALUES (', semestre,', ', 
                                               nomeDisciplina,', ', 
											   siglaDisciplina,', ', 
                                               totalHoras,', ', 
                                               ementa,');') as '-- INSERT ON Disciplinas' FROM Disciplina;
                                               
                                               
SELECT "DELETE FROM Turno;" as '-- DELETE ALL RECORDS ON Turno';
SELECT CONCAT('INSERT INTO Turno VALUES (', codTurno, ', ', nomeTurno, ');') as '-- INSERT ON Turno' FROM Turno;
 
SELECT "DELETE FROM EstadoMat;" as '-- DELETE ALL RECORDS ON EstadoMat';
SELECT CONCAT('INSERT INTO EstadoMat')