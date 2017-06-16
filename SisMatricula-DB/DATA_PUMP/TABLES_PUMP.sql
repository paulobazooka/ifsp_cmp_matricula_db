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
SELECT CONCAT('INSERT INTO Turno VALUES (',codEstado, ', ', descricao, ');') as '-- INSERT ON EstadoMat' FROM EstadoMat;


SELECT "DELETE FROM DisciplinaPreRequisitos;" as '-- DELETE ALL RECORDS ON DisciplinaPreRequisitos';
SELECT CONCAT('INSERT INTO DisciplinaPreRequisitos VALUES (', codDisciplina, ', ', preRequisito, ');') as '-- INSERT ON DisciplinaPreRequisitos' FROM DisciplinaPreRequisitos;


SELECT "DELETE FROM CursoDisciplina;" as '-- DELETE ALL RECORDS ON CursoDisciplina';
SELECT CONCAT('INSERT INTO CursoDisciplina VALUES (', codCurso, ', ', codDisciplina, ');') as '-- INSERT ON CursoDisciplina VALUES' FROM CursoDisciplina;                                                
                                               

SELECT "DELETE FROM TipoUsuario;" as '-- DELETE ALL RECORDS ON TipoUsuario';
SELECT CONCAT('INSERT INTO TipoUsuario VALUES (', descricao, ');') as '-- INSERT ON TipoUsuario' FROM TipoUsuario;


SELECT "DELETE FROM Usuario;" as '-- DELETE ALL RECORDS ON Usuario';  
SELECT CONCAT('INSERT INTO Usuario VALUES (', senha, ', ', nomeUsuario, ', ', identificacao, ', ', 
											dataNas, ', ', cpf, ', ', ', ', ingresso, ', ', email,
                                            telefone1, ', ', telefone2, ', ', codTipoUsuario, ');') 
                                            as 'INSERT ON Usuario VALUES' FROM Usuario; 
                                            

SELECT "DELETE FROM AlunoCurso;" as '-- DELETE ALL RECORDS ON AlunoCurso'; 
SELECT CONCAT('INSERT INTO AlunoCurso VALUES (', codCurso, ', ', codUsuario, ');') as 'INSERT ON AlunoCurso VALUES' FROM AlunoCurso;

SELECT "DELETE FROM Turma;" as '-- DELETE ALL RECORDS ON Turma';
SELECT CONCAT('INSERT INTO Turma VALUES (', siglaTurma, ', ', codCurso, ', ', codDisciplina, ', ',   
                                          anoTurma, ', ', semestreTurma, ', ', codTurno, ', ', vagas, ', ',
                                          turmaEncerrada, ', ', aberto, ');') as 'INSERT ON Turma VALUES' FROM Turma;
                                          
		
SELECT "DELETE FROM Horario;" as '-- DELETE ALL RECORDS ON Horario';
SELECT CONCAT('INSERT INTO Horario VALUES (', codTurma, ', ', diaSemana, ', ', horaInicio, ', ', horaTermino, ');') as 'INSERT ON Horario VALUES' FROM Horario;


SELECT "DELETE FROM ProfessorTurma;" as '-- DELETE ALL RECORDS ON ProfessorTurma';
SELECT CONCAT('INSERT INTO ProfessorTurma VALUES (', codUsuario, ', ', codTurma, ');') as 'INSERT ON ProfessorTurma VALUES' FROM ProfessorTurma;


SELECT "DELETE FROM Matricula;" as '-- DELETE ALL RECORDS ON Matricula';
SELECT CONCAT('INSERT INTO Matricula VALUES (', codTurma, ', ', codUsuario, ', ', codEstado, ', ', concluido, ', ', dtMatricula, ');') as 'INSERT ON Matricula VALUES' FROM Matricula;
