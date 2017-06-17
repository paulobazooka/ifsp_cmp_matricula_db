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
