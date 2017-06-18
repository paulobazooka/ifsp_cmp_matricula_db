USE SisMatricula;
SELECT "USE SisMatricula;" as '-- SELECT DATABASE';


SELECT "DELETE FROM Curso;" as '-- DELETE ALL RECORDS ON Curso';
SELECT CONCAT("INSERT INTO Curso VALUES (",codCurso,", '", 
	                                      nomeCurso,"', '", 
										                   siglaCurso, "', '", 
                                          dtCurso, "', '", 
                                          descricao, "');") as '-- INSERT ON Curso' FROM Curso;


SELECT "DELETE FROM Disciplina;" as '-- DELETE ALL RECORDS ON Disciplina';
SELECT CONCAT("INSERT INTO Disciplina VALUES (", codDisciplina,", '" ,	                                                 
                                                nomeDisciplina,"', ", 
                                                      semestre,", '", 
											                         siglaDisciplina,"', ", 
                                               totalHoras,", '", 
                                               ementa,"');") as '-- INSERT ON Disciplinas' FROM Disciplina;
                                               
                                               
SELECT "DELETE FROM Turno;" as '-- DELETE ALL RECORDS ON Turno';
SELECT CONCAT('INSERT INTO Turno VALUES (', codTurno, ", '", nomeTurno, "');") as '-- INSERT ON Turno' FROM Turno;


SELECT "DELETE FROM EstadoMat;" as '-- DELETE ALL RECORDS ON EstadoMat';
SELECT CONCAT('INSERT INTO EstadoMat VALUES (',codEstado, ", '", descricao, "');") as '-- INSERT ON EstadoMat' FROM EstadoMat;


SELECT "DELETE FROM DisciplinaPreRequisitos;" as '-- DELETE ALL RECORDS ON DisciplinaPreRequisitos';
SELECT CONCAT('INSERT INTO DisciplinaPreRequisitos VALUES (', codDisciplina, ', ', preRequisito, ');') as '-- INSERT ON DisciplinaPreRequisitos' FROM DisciplinaPreRequisitos;


SELECT "DELETE FROM CursoDisciplina;" as '-- DELETE ALL RECORDS ON CursoDisciplina';
SELECT CONCAT('INSERT INTO CursoDisciplina VALUES (', codCurso, ', ', codDisciplina, ');') as '-- INSERT ON CursoDisciplina VALUES' FROM CursoDisciplina;                                                
                                               

SELECT "DELETE FROM TipoUsuario;" as '-- DELETE ALL RECORDS ON TipoUsuario';
SELECT CONCAT("INSERT INTO TipoUsuario VALUES (",codTipoUsuario,", '", descricao, "');") as '-- INSERT ON TipoUsuario' FROM TipoUsuario;


SELECT "DELETE FROM Usuario;" as '-- DELETE ALL RECORDS ON Usuario';  
SELECT CONCAT("INSERT INTO Usuario VALUES (",    codUsuario, ", '",
                                              identificacao, "', '",
                                                nomeUsuario, "', '",        
	 												                            senha, "', '", 
	                                                  dataNas, "', ", 
                  							                        cpf, ", '", 
                  							                   ingresso, "', '", 
                  							                      email, "', '",
                                                  telefone1, "', '", 
                                                  telefone2, "', ", 
                                             codTipoUsuario, ");") 
                                            as '-- INSERT ON Usuario VALUES' FROM Usuario; 
                                            

SELECT "DELETE FROM AlunoCurso;" as '-- DELETE ALL RECORDS ON AlunoCurso'; 
SELECT CONCAT('INSERT INTO AlunoCurso VALUES (', codCurso, ', ', codUsuario, ', ', concluido, ');') as '-- INSERT ON AlunoCurso VALUES' FROM AlunoCurso;



SELECT "DELETE FROM Turma;" as '-- DELETE ALL RECORDS ON Turma';
SELECT CONCAT("INSERT INTO Turma VALUES (",    codTurma,", '", 
	  										 siglaTurma,"', ", 
	                                           codCurso, ', ', 
	                                      codDisciplina, ', ',   
                                               anoTurma, ', ', 
                                          semestreTurma, ', ', 
                                           	   codTurno, ', ', 
                                          		  vagas, ', ',
                                 matriculasRealizadas, ', ',
                                         turmaEncerrada, ', ', 
                                                 aberto, ');') as '-- INSERT ON Turma VALUES' FROM Turma;
                                          
		
SELECT "DELETE FROM Horario;" as '-- DELETE ALL RECORDS ON Horario';
SELECT CONCAT('INSERT INTO Horario VALUES (', codTurma, ", '", diaSemana, "', '", horaInicio, "', '", horaTermino, "');") as '-- INSERT ON Horario VALUES' FROM Horario;


SELECT "DELETE FROM ProfessorTurma;" as '-- DELETE ALL RECORDS ON ProfessorTurma';
SELECT CONCAT('INSERT INTO ProfessorTurma VALUES (', codUsuario, ', ', codTurma, ');') as '-- INSERT ON ProfessorTurma VALUES' FROM ProfessorTurma;


SELECT "DELETE FROM Matricula;" as '-- DELETE ALL RECORDS ON Matricula';
SELECT CONCAT('INSERT INTO Matricula VALUES (', codMatricula, ', ', 
	                                                  codTurma, ', ', 
	                                                codUsuario, ", '", 
	                                               dtMatricula, "', ", 
	                                                 concluido, ", ", 
	                                                 codEstado, ");") as '-- INSERT ON Matricula VALUES' FROM Matricula;


SELECT "DELETE FROM AssinaturaDigitalMatricula;" as "-- DELETE ALL RECORDS ON AssinaturaDigitalMatricula";
SELECT CONCAT("INSERT INTO AssinaturaDigitalMatricula VALUES (", codAss, ", ", codMatricula, ", '", dtDeferimento,"', '", assinatura, "');") as " -- INSERT ON AssinaturaDigitalMatricula VALUES" FROM AssinaturaDigitalMatricula;


SELECT "DELETE FROM TabelaAlteracoes;" as "-- DELETE ALL RECORDS ON TabelaAlteracoes";
SELECT CONCAT("INSERT INTO TabelaAlteracoes VALUES (", codAlteracao, ", '", usuario, "', '", horaAlteracao, "', '", tabelaAlterada, "', '", comando, "', ", linhaAlterada, ");") as "-- INSERT ON TabelaAlteracoes VALUES" FROM TabelaAlteracoes;