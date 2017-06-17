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