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
