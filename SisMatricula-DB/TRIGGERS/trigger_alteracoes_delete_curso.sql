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