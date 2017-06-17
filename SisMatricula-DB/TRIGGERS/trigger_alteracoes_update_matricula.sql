
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