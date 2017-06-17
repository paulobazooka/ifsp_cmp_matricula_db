
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