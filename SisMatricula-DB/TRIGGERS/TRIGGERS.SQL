





USE SisMatricula;
DROP TRIGGER if exists trigger_alteracoes_delete_matricula;
DELIMITER ||
CREATE TRIGGER trigger_alteracoes_delete_matricula
AFTER DELETE ON Matricula
FOR EACH ROW
BEGIN
     DECLARE cod INT;
     DECLARE _user VARCHAR(30);
     
     SET cod = old.codMatricula;
     SET _user = (select user());
     
     INSERT INTO TabelaAlteracoes(usuario, tabelaAlterada,  comando, linhaAlterada) VALUES
				                 (_user,      'Matricula', 'DELETE',           cod);
END ||
DELIMITER ;
# ----------------------------------------------------------------------------------------------------





# ------------------ Triggers para capturar alterações feitas na tabela Usuario ----------------------
USE SisMatricula;
DROP TRIGGER if exists trigger_alteracoes_insert_usuario;
DELIMITER ||
CREATE TRIGGER trigger_alteracoes_insert_usuario
AFTER INSERT ON Usuario
FOR EACH ROW
BEGIN
     DECLARE cod INT;
     DECLARE _user VARCHAR(30);
     
     SET cod = (select codUsuario from Usuario order by codUsuario DESC LIMIT 1);
     SET _user = (select user());
     
     INSERT INTO TabelaAlteracoes(usuario, tabelaAlterada,  comando, linhaAlterada) VALUES
				                 (_user,      'Usuario', 'INSERT',           cod);
END ||
DELIMITER ;




USE SisMatricula;
DROP TRIGGER if exists trigger_alteracoes_update_usuario;
DELIMITER ||
CREATE TRIGGER trigger_alteracoes_update_usuario
AFTER UPDATE ON Usuario
FOR EACH ROW
BEGIN
     DECLARE cod INT;
     DECLARE _user VARCHAR(30);
     
     SET cod = new.codUsuario;
     SET _user = (select user());
     
     INSERT INTO TabelaAlteracoes(usuario, tabelaAlterada,  comando, linhaAlterada) VALUES
				                 (_user,      'Usuario', 'UPDATE',           cod);
END ||
DELIMITER ;




USE SisMatricula;
DROP TRIGGER if exists trigger_alteracoes_delete_usuario;
DELIMITER ||
CREATE TRIGGER trigger_alteracoes_delete_usuario
AFTER DELETE ON Usuario
FOR EACH ROW
BEGIN
     DECLARE cod INT;
     DECLARE _user VARCHAR(30);
     
     SET cod = old.codUsuario;
     SET _user = (select user());
     
     INSERT INTO TabelaAlteracoes(usuario, tabelaAlterada,  comando, linhaAlterada) VALUES
				                 (_user,      'Usuario', 'DELETE',           cod);
END ||
DELIMITER ;
# ----------------------------------------------------------------------------------------------------



# ------------------ Triggers para capturar alterações feitas na tabela Turma ----------------------
USE SisMatricula;
DROP TRIGGER if exists trigger_alteracoes_insert_turma;
DELIMITER ||
CREATE TRIGGER trigger_alteracoes_insert_turma
AFTER INSERT ON Turma
FOR EACH ROW
BEGIN
     DECLARE cod INT;
     DECLARE _user VARCHAR(30);
     
     SET cod = (select codTurma from Turma order by codTurma DESC LIMIT 1);
     SET _user = (select user());
     
     INSERT INTO TabelaAlteracoes(usuario, tabelaAlterada,  comando, linhaAlterada) VALUES
				                 (_user,      'Turma', 'INSERT',           cod);
END ||
DELIMITER ;




USE SisMatricula;
DROP TRIGGER if exists trigger_alteracoes_update_turma;
DELIMITER ||
CREATE TRIGGER trigger_alteracoes_update_turma
AFTER UPDATE ON Turma
FOR EACH ROW
BEGIN
     DECLARE cod INT;
     DECLARE _user VARCHAR(30);
     
     SET cod = new.codTurma;
     SET _user = (select user());
     
     INSERT INTO TabelaAlteracoes(usuario, tabelaAlterada,  comando, linhaAlterada) VALUES
				                 (_user,          'Turma', 'UPDATE',           cod);
END ||
DELIMITER ;




USE SisMatricula;
DROP TRIGGER if exists trigger_alteracoes_delete_turma;
DELIMITER ||
CREATE TRIGGER trigger_alteracoes_delete_turma
AFTER DELETE ON Turma
FOR EACH ROW
BEGIN
     DECLARE cod INT;
     DECLARE _user VARCHAR(30);
     
     SET cod = old.codTurma;
     SET _user = (select user());
     
     INSERT INTO TabelaAlteracoes(usuario, tabelaAlterada,  comando, linhaAlterada) VALUES
				                 (_user,          'Turma', 'DELETE',           cod);
END ||
DELIMITER ;
# ----------------------------------------------------------------------------------------------------




# ------------------ Triggers para capturar alterações feitas na tabela Disciplina ----------------------
USE SisMatricula;
DROP TRIGGER if exists trigger_alteracoes_insert_disciplina;
DELIMITER ||
CREATE TRIGGER trigger_alteracoes_insert_disciplina
AFTER INSERT ON Disciplina
FOR EACH ROW
BEGIN
     DECLARE cod INT;
     DECLARE _user VARCHAR(30);
     
     SET cod = (select codDisciplina from Disciplina order by codDisciplina DESC LIMIT 1);
     SET _user = (select user());
     
     INSERT INTO TabelaAlteracoes(usuario, tabelaAlterada,  comando, linhaAlterada) VALUES
				                 (_user,     'Disciplina', 'INSERT',           cod);
END ||
DELIMITER ;




USE SisMatricula;
DROP TRIGGER if exists trigger_alteracoes_update_disciplina;
DELIMITER ||
CREATE TRIGGER trigger_alteracoes_update_disciplina
AFTER UPDATE ON Disciplina
FOR EACH ROW
BEGIN
     DECLARE cod INT;
     DECLARE _user VARCHAR(30);
     
     SET cod = new.codDisciplina;
     SET _user = (select user());
     
     INSERT INTO TabelaAlteracoes(usuario, tabelaAlterada,  comando, linhaAlterada) VALUES
				                 (_user,      'Disciplina', 'UPDATE',           cod);
END ||
DELIMITER ;




USE SisMatricula;
DROP TRIGGER if exists trigger_alteracoes_delete_disciplina;
DELIMITER ||
CREATE TRIGGER trigger_alteracoes_delete_disciplina
AFTER DELETE ON Disciplina
FOR EACH ROW
BEGIN
     DECLARE cod INT;
     DECLARE _user VARCHAR(30);
     
     SET cod = old.codDisciplina;
     SET _user = (select user());
     
     INSERT INTO TabelaAlteracoes(usuario, tabelaAlterada,  comando, linhaAlterada) VALUES
				                 (_user,      'Disciplina', 'DELETE',           cod);
END ||
DELIMITER ;
# ----------------------------------------------------------------------------------------------------




# ------------------ Triggers para capturar alterações feitas na tabela Curso ----------------------
USE SisMatricula;
DROP TRIGGER if exists trigger_alteracoes_insert_curso;
DELIMITER ||
CREATE TRIGGER trigger_alteracoes_insert_curso
AFTER INSERT ON Curso
FOR EACH ROW
BEGIN
     DECLARE cod INT;
     DECLARE _user VARCHAR(30);
     
     SET cod = (select codCurso from Curso order by codCurso DESC LIMIT 1);
     SET _user = (select user());
     
     INSERT INTO TabelaAlteracoes(usuario, tabelaAlterada,  comando, linhaAlterada) VALUES
				                 (_user,      'Curso', 'INSERT',           cod);
END ||
DELIMITER ;




USE SisMatricula;
DROP TRIGGER if exists trigger_alteracoes_update_curso;
DELIMITER ||
CREATE TRIGGER trigger_alteracoes_update_curso
AFTER UPDATE ON Curso
FOR EACH ROW
BEGIN
     DECLARE cod INT;
     DECLARE _user VARCHAR(30);
     
     SET cod = new.codCurso;
     SET _user = (select user());
     
     INSERT INTO TabelaAlteracoes(usuario, tabelaAlterada,  comando, linhaAlterada) VALUES
				                 (_user,      'Curso', 'UPDATE',           cod);
END ||
DELIMITER ;




USE SisMatricula;
DROP TRIGGER if exists trigger_alteracoes_delete_curso;
DELIMITER ||
CREATE TRIGGER trigger_alteracoes_delete_curso
AFTER DELETE ON Curso
FOR EACH ROW
BEGIN
     DECLARE cod INT;
     DECLARE _user VARCHAR(30);
     
     SET cod = old.codCurso;
     SET _user = (select user());
     
     INSERT INTO TabelaAlteracoes(usuario, tabelaAlterada,  comando, linhaAlterada) VALUES
				                 (_user,      'Curso', 'DELETE',           cod);
END ||
DELIMITER ;
# ----------------------------------------------------------------------------------------------------