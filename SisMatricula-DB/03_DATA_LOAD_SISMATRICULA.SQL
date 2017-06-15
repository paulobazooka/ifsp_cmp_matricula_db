USE SisMatricula;

-- -----------------------------------------------------------------------------
SELECT 'LOADING DATA...' AS ' ';
SOURCE DATA/SISMATRICULA_LOAD.SQL
SELECT COUNT(codCurso)       AS 'RECORDS INSERTED ON TABLE Curso:'                   FROM SisMatricula.Curso;
SELECT COUNT(codDisciplina)  AS 'RECORDS INSERTED ON TABLE Disciplina:'              FROM SisMatricula.Disciplina;
SELECT COUNT(codTurno)       AS 'RECORDS INSERTED ON TABLE Turno:'                   FROM SisMatricula.Turno;
SELECT COUNT(codEstado)      AS 'RECORDS INSERTED ON TABLE Disciplina:'              FROM SisMatricula.EstadoMat;
SELECT COUNT(codDisciplina)  AS 'RECORDS INSERTED ON TABLE DisciplinaPreRequisitos:' FROM SisMatricula.DisciplinaPreRequisitos;
SELECT COUNT(codCurso)       AS 'RECORDS INSERTED ON TABLE CursoDisciplina:'         FROM SisMatricula.CursoDisciplina;
SELECT COUNT(codTipoUsuario) AS 'RECORDS INSERTED ON TABLE TipoUsuario:'             FROM SisMatricula.TipoUsuario;
SELECT COUNT(codUsuario)     AS 'RECORDS INSERTED ON TABLE Usuario:'                 FROM SisMatricula.Usuario;
SELECT COUNT(codUsuario)     AS 'RECORDS INSERTED ON TABLE AlunoCurso:'              FROM SisMatricula.AlunoCurso;
SELECT COUNT(codTurma)       AS 'RECORDS INSERTED ON TABLE Turma:'                   FROM SisMatricula.Turma;
SELECT COUNT(codTurma)       AS 'RECORDS INSERTED ON TABLE Disciplina:'              FROM SisMatricula.Horario;
SELECT COUNT(codTurma)       AS 'RECORDS INSERTED ON TABLE ProfessorTurma:'          FROM SisMatricula.ProfessorTurma;
SELECT COUNT(codMatricula)   AS 'RECORDS INSERTED ON TABLE Matricula:'               FROM SisMatricula.Matricula;
SELECT COUNT(codTurma)       AS 'RECORDS INSERTED ON TABLE DisciplinaConcluida:'     FROM SisMatricula.DisciplinaConcluida;
SELECT 'DONE!' AS ' ';

