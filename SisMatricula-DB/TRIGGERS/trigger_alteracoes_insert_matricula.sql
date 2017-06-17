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