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