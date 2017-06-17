# ------------------ Triggers para capturar alterações feitas na tabela Turma ----------------------
USE SisMatricula;
DROP TRIGGER if exists trigger_alteracoes_insert_turma;
DELIMITER ||
CREATE TRIGGER trigger_alteracoes_insert_turma
AFTER INSERT ON Turma
FOR EACH ROW
BEGIN
     DECLARE cod INT;
     DECLARE _user VARCHAR(30);
     
     SET cod = (select codTurma from Turma order by codTurma DESC LIMIT 1);
     SET _user = (select user());
     
     INSERT INTO TabelaAlteracoes(usuario, tabelaAlterada,  comando, linhaAlterada) VALUES
				                 (_user,      'Turma', 'INSERT',           cod);
END ||
DELIMITER ;
