
# Criar trigger para atualizar a tabela turma toda vez que a matricula for aceita
USE SisMatricula;
DROP TRIGGER if exists trigger_atualiza_turma;
DELIMITER ||
CREATE TRIGGER trigger_atualiza_turma
AFTER UPDATE ON Matricula
FOR EACH ROW
BEGIN

IF (NEW.codEstado = 3) THEN		 -- Se a matricula foi deferida...
	IF (OLD.codEstado = 1) THEN  -- Se houve solicitação anteriormente
    UPDATE Turma t
	SET t.matriculasRealizadas = t.matriculasRealizadas + 1 
    WHERE t.codTurma = New.codTurma;
	INSERT INTO AssinaturaDigitalMatricula (codMatricula, assinatura) VALUES
			    (NEW.codMatricula, md5(NEW.codMatricula + NEW.codTurma + NEW.codUsuario + NEW.dtMatricula + now()));
    END IF;
    
ELSEIF (NEW.codEstado = 4) THEN	 -- Se a matricula foi cancelada...
    IF (OLD.codEstado = 3) THEN  -- Se a matricula havia sido deferida
	UPDATE Turma t
	SET t.matriculasRealizadas = t.matriculasRealizadas - 1 
    WHERE t.codTurma = New.codTurma;
    END IF;
    
ELSEIF (NEW.codEstado = 5) THEN	 -- Se houve abandono na disciplina...
    IF (OLD.codEstado = 3) THEN  -- Se a matricula havia sido deferida
	UPDATE Turma t
	SET t.matriculasRealizadas = t.matriculasRealizadas - 1 
    WHERE t.codTurma = New.codTurma;
	END IF;
END IF;

END ||
DELIMITER ;





# Criar trigger para atualizar a tabela disciplina concluida quando for mudado o status de conclusão na matricula
USE SisMatricula;
DROP TRIGGER if exists trigger_atualiza_disciplina_concluida_update;
DELIMITER ||
CREATE TRIGGER trigger_atualiza_disciplina_concluida_update
AFTER UPDATE ON Matricula
FOR EACH ROW
BEGIN
IF (NEW.concluido = true) THEN		 -- Se houve conclusão da disciplina   
         INSERT DisciplinaConcluida (codUsuario, codTurma) VALUES 
	     (NEW.codUsuario, NEW.codTurma);
   
END IF;

END ||
DELIMITER ;




# ------------------ Triggers para capturar alterações feitas na tabela Matricula ---------------------
USE SisMatricula;
DROP TRIGGER if exists trigger_alteracoes_insert_matricula;
DELIMITER ||
CREATE TRIGGER trigger_alteracoes_insert_matricula
AFTER INSERT ON Matricula
FOR EACH ROW
BEGIN
     DECLARE cod INT;
     DECLARE _user VARCHAR(30);
     
     SET cod = (select codMatricula from Matricula order by codMatricula DESC LIMIT 1);
     SET _user = (select user());
     
     INSERT INTO TabelaAlteracoes(usuario, tabelaAlterada,  comando, linhaAlterada) VALUES
				                 (_user,      'Matricula', 'INSERT',           cod);
END ||
DELIMITER ;




USE SisMatricula;
DROP TRIGGER if exists trigger_alteracoes_update_matricula;
DELIMITER ||
CREATE TRIGGER trigger_alteracoes_update_matricula
AFTER UPDATE ON Matricula
FOR EACH ROW
BEGIN
     DECLARE cod INT;
     DECLARE _user VARCHAR(30);
     
     SET cod = new.codMatricula;
     SET _user = (select user());
     
     INSERT INTO TabelaAlteracoes(usuario, tabelaAlterada,  comando, linhaAlterada) VALUES
				                 (_user,      'Matricula', 'UPDATE',           cod);
END ||
DELIMITER ;




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