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
