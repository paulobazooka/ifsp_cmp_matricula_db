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